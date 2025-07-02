import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/config/ansicolor.dart';
import '../../domain/Repositories/address_repository.dart';
import '../../domain/entity/address_entity.dart';
import '../models/address_model.dart';

class AddressRepositoryHybrid implements AddressRepository {
  final Box<AddressModel> _hiveBox = Hive.box<AddressModel>('addresses');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static const String _collection = 'addresses';

  @override
  Future<List<AddressEntity>> getAddresses({String? userId}) async {
    try {
      // First try to get from Firestore
      final currentUserId = userId ?? _auth.currentUser?.uid;
      if (currentUserId != null) {
        try {
          final querySnapshot = await _firestore
              .collection(_collection)
              .where('userId', isEqualTo: currentUserId)
              .orderBy('createdAt', descending: true)
              .get();

          final firestoreAddresses = querySnapshot.docs
              .map((doc) => AddressModel.fromFirestore(doc.data(), doc.id))
              .toList();

          // Sync with Hive
          await _syncWithHive(firestoreAddresses);

          return firestoreAddresses;
        } catch (e) {
          // If Firestore fails, fall back to Hive
          log(DebugConsoleMessages.error('Firestore failed, using Hive: $e'));
        }
      }

      // Fallback to Hive
      return _hiveBox.values.toList();
    } catch (e) {
      throw Exception('Failed to get addresses: $e');
    }
  }

  @override
  Future<void> addAddress(AddressEntity address) async {
    try {
      final addressModel = AddressModel.fromEntity(address);

      // Add to Hive first for immediate availability
      await _hiveBox.add(addressModel);

      // Try to add to Firestore
      final currentUserId = _auth.currentUser?.uid;
      if (currentUserId != null) {
        try {
          final addressData = addressModel.toMap();
          addressData['userId'] = currentUserId;

          final docRef =
              await _firestore.collection(_collection).add(addressData);

          // Update the Hive model with the Firestore ID
          final updatedModel = AddressModel(
            id: docRef.id,
            fullName: addressModel.fullName,
            email: addressModel.email,
            address: addressModel.address,
            city: addressModel.city,
            details: addressModel.details,
            userId: currentUserId,
          );

          // Update the last added item in Hive
          final lastIndex = _hiveBox.length - 1;
          if (lastIndex >= 0) {
            await _hiveBox.putAt(lastIndex, updatedModel);
          }
        } catch (e) {
          log(DebugConsoleMessages.error('Failed to sync with Firestore: $e'));
          // Continue with local storage only
        }
      }
    } catch (e) {
      throw Exception('Failed to add address: $e');
    }
  }

  @override
  Future<void> updateAddress(AddressEntity address) async {
    try {
      if (address.id == null) {
        throw Exception('Address ID is required for update');
      }

      final addressModel = AddressModel.fromEntity(address);

      // Update in Hive
      final hiveIndex =
          _hiveBox.values.toList().indexWhere((a) => a.id == address.id);
      if (hiveIndex != -1) {
        await _hiveBox.putAt(hiveIndex, addressModel);
      }

      // Try to update in Firestore
      try {
        final addressData = addressModel.toMap();
        await _firestore
            .collection(_collection)
            .doc(address.id)
            .update(addressData);
      } catch (e) {
        log(DebugConsoleMessages.error(
            'Failed to sync update with Firestore: $e'));
      }
    } catch (e) {
      throw Exception('Failed to update address: $e');
    }
  }

  @override
  Future<void> deleteAddress(String addressId) async {
    try {
      // Delete from Hive
      final hiveIndex =
          _hiveBox.values.toList().indexWhere((a) => a.id == addressId);
      if (hiveIndex != -1) {
        await _hiveBox.deleteAt(hiveIndex);
      }

      // Try to delete from Firestore
      try {
        await _firestore.collection(_collection).doc(addressId).delete();
      } catch (e) {
        log(DebugConsoleMessages.error(
            'Failed to sync delete with Firestore: $e'));
      }
    } catch (e) {
      throw Exception('Failed to delete address: $e');
    }
  }

  @override
  Future<void> deleteAddressByIndex(int index) async {
    try {
      final addresses = _hiveBox.values.toList();
      if (index >= 0 && index < addresses.length) {
        final address = addresses[index];
        await _hiveBox.deleteAt(index);

        // Try to delete from Firestore if it has an ID
        if (address.id != null) {
          try {
            await _firestore.collection(_collection).doc(address.id).delete();
          } catch (e) {
            log(DebugConsoleMessages.error(
                'Failed to sync delete with Firestore: $e'));
          }
        }
      }
    } catch (e) {
      throw Exception('Failed to delete address by index: $e');
    }
  }

  // Helper method to sync Hive with Firestore data
  Future<void> _syncWithHive(List<AddressModel> firestoreAddresses) async {
    try {
      // Clear Hive and add Firestore data
      await _hiveBox.clear();
      for (final address in firestoreAddresses) {
        await _hiveBox.add(AddressModel(
          id: address.id,
          fullName: address.fullName,
          email: address.email,
          address: address.address,
          city: address.city,
          details: address.details,
          userId: address.userId,
        ));
      }
    } catch (e) {
      log(DebugConsoleMessages.error('Failed to sync Hive with Firestore: $e'));
    }
  }
}
