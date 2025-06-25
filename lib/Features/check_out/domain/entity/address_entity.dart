abstract class AddressEntity {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String details;
  final String? userId;

  AddressEntity({
    this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.details,
    this.userId,
  });
}
