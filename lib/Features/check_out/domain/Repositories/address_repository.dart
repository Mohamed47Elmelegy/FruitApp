import '../entity/address_entity.dart';

abstract class AddressRepository {
  Future<List<AddressEntity>> getAddresses({String? userId});
  Future<void> addAddress(AddressEntity address);
  Future<void> updateAddress(AddressEntity address);
  Future<void> deleteAddress(String addressId);
  Future<void> deleteAddressByIndex(int index);
}
