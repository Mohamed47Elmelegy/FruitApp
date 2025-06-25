import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

import '../../domain/Entities/user_entities.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserEntities {
  @HiveField(0)
  @override
  final String uId;

  @HiveField(1)
  @override
  final String name;

  @HiveField(2)
  @override
  final String email;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
  }) : super(uId: uId, name: name, email: email);

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? "",
      email: user.email ?? '',
    );
  }
  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }

  factory UserModel.fromEntity(UserEntities userEntities) {
    return UserModel(
      uId: userEntities.uId,
      name: userEntities.name,
      email: userEntities.email,
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
    );
  }
}
