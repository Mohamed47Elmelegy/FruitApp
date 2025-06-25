import 'package:hive/hive.dart';
import '../../domain/Repositories/address_repository.dart';
import '../../domain/entity/address_entity.dart';
import '../models/address_model.dart';

class AddressRepositoryHive implements AddressRepository {
  final Box<AddressModel> _box = Hive.box<AddressModel>('addresses');

  @override
  Future<List<AddressEntity>> getAddresses({String? userId}) async {
    return _box.values.toList();
  }

  @override
  Future<void> addAddress(AddressEntity address) async {
    final addressModel = AddressModel.fromEntity(address);
    await _box.add(addressModel);
  }

  @override
  Future<void> updateAddress(AddressEntity address) async {
    if (address.id == null) {
      throw Exception('Address ID is required for update');
    }

    final addressModel = AddressModel.fromEntity(address);
    final index = _box.values.toList().indexWhere((a) => a.id == address.id);
    if (index != -1) {
      await _box.putAt(index, addressModel);
    }
  }

  @override
  Future<void> deleteAddress(String addressId) async {
    final index = _box.values.toList().indexWhere((a) => a.id == addressId);
    if (index != -1) {
      await _box.deleteAt(index);
    }
  }

  @override
  Future<void> deleteAddressByIndex(int index) async {
    await _box.deleteAt(index);
  }
}
