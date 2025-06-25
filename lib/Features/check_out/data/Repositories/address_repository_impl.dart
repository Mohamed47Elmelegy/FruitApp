import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/Repositories/address_repository.dart';
import '../../domain/entity/address_entity.dart';
import '../models/address_model.dart';

class AddressRepositoryImpl implements AddressRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static const String _collection = 'addresses';

  @override
  Future<List<AddressEntity>> getAddresses({String? userId}) async {
    try {
      final currentUserId = userId ?? _auth.currentUser?.uid;
      if (currentUserId == null) {
        throw Exception('User not authenticated');
      }

      final querySnapshot = await _firestore
          .collection(_collection)
          .where('userId', isEqualTo: currentUserId)
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => AddressModel.fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to get addresses: $e');
    }
  }

  @override
  Future<void> addAddress(AddressEntity address) async {
    try {
      final currentUserId = _auth.currentUser?.uid;
      if (currentUserId == null) {
        throw Exception('User not authenticated');
      }

      final addressModel = AddressModel.fromEntity(address);
      final addressData = addressModel.toMap();
      addressData['userId'] = currentUserId;

      await _firestore.collection(_collection).add(addressData);
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
      final addressData = addressModel.toMap();

      await _firestore
          .collection(_collection)
          .doc(address.id)
          .update(addressData);
    } catch (e) {
      throw Exception('Failed to update address: $e');
    }
  }

  @override
  Future<void> deleteAddress(String addressId) async {
    try {
      await _firestore.collection(_collection).doc(addressId).delete();
    } catch (e) {
      throw Exception('Failed to delete address: $e');
    }
  }

  @override
  Future<void> deleteAddressByIndex(int index) async {
    try {
      final addresses = await getAddresses();
      if (index >= 0 && index < addresses.length) {
        final addressId = addresses[index].id;
        if (addressId != null) {
          await deleteAddress(addressId);
        }
      }
    } catch (e) {
      throw Exception('Failed to delete address by index: $e');
    }
  }
}
