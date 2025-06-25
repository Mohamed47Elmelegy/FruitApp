import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/address_model.dart';
import '../../domain/Repositories/address_repository.dart';

class AddressCubit extends Cubit<List<AddressModel>> {
  final AddressRepository repository;

  AddressCubit(this.repository) : super([]) {
    loadAddresses();
  }

  Future<void> loadAddresses() async {
    try {
      final addresses = await repository.getAddresses();
      if (isClosed) return;
      emit(addresses.cast<AddressModel>());
    } catch (e) {
      // Handle error - you might want to emit an error state
      log('Error loading addresses: $e');
      if (isClosed) return;
      emit([]);
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      await repository.addAddress(address);
      await loadAddresses();
    } catch (e) {
      log('Error adding address: $e');
      // Handle error
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    try {
      await repository.updateAddress(address);
      await loadAddresses();
    } catch (e) {
      log('Error updating address: $e');
      // Handle error
    }
  }

  Future<void> deleteAddress(String addressId) async {
    try {
      await repository.deleteAddress(addressId);
      await loadAddresses();
    } catch (e) {
      log('Error deleting address: $e');
      // Handle error
    }
  }

  Future<void> deleteAddressByIndex(int index) async {
    try {
      await repository.deleteAddressByIndex(index);
      await loadAddresses();
    } catch (e) {
      log('Error deleting address by index: $e');
      // Handle error
    }
  }
}
