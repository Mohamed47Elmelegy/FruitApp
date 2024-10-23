import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/Entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel({
    required super.uId,
    required super.name,
    required super.email,
  });

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
