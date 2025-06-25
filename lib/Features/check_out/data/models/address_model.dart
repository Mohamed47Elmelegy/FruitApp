import 'package:hive/hive.dart';
import '../../domain/entity/address_entity.dart';
part 'address_model.g.dart';

@HiveType(typeId: 6)
class AddressModel extends HiveObject implements AddressEntity {
  @HiveField(0)
  @override
  final String? id;

  @HiveField(1)
  @override
  final String fullName;

  @HiveField(2)
  @override
  final String email;

  @HiveField(3)
  @override
  final String address;

  @HiveField(4)
  @override
  final String city;

  @HiveField(5)
  @override
  final String details;

  @HiveField(6)
  @override
  final String? userId;

  AddressModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.details,
    this.userId,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'details': details,
      'userId': userId,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    };
  }

  // Create from Firestore document
  factory AddressModel.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return AddressModel(
      id: documentId,
      fullName: data['fullName'] as String? ?? '',
      email: data['email'] as String? ?? '',
      address: data['address'] as String? ?? '',
      city: data['city'] as String? ?? '',
      details: data['details'] as String? ?? '',
      userId: data['userId'] as String?,
    );
  }

  // Create from domain entity
  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      address: entity.address,
      city: entity.city,
      details: entity.details,
      userId: entity.userId,
    );
  }

  // Convert to domain entity
  AddressEntity toEntity() {
    return AddressModel(
      id: id,
      fullName: fullName,
      email: email,
      address: address,
      city: city,
      details: details,
      userId: userId,
    );
  }
}
