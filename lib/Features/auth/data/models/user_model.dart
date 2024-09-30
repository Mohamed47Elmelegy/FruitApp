import 'package:firebase_auth/firebase_auth.dart';

import '../../domin/Entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel({required super.uId, required super.name, required super.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? "",
      email: user.email ?? '',
    );
  }

  factory UserModel.toJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
    );
  }
}
