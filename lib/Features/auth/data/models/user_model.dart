import 'package:firebase_auth/firebase_auth.dart';

import '../../domin/Entities/user_entities.dart';

// UserModel is a class that extends UserEntities and is used to represent a user
// It takes a uId, name and email as parameters in its constructor
// The factory method fromFirebaseUser is used to create a UserModel from a Firebase user
// It takes a Firebase user as a parameter and returns a UserModel with the user's id, name and email

class UserModel extends UserEntities {
  // The constructor takes a uId, name and email as parameters
  UserModel(super.uId, {required super.name, required super.email});

  // The factory method fromFirebaseUser takes a Firebase user as a parameter
  // It returns a UserModel with the user's id, name and email
  factory UserModel.fromFirebaseUser(User user) {
    // The UserModel is created with the user's id, name and email
    return UserModel(
      user.uid,
      // If the user's display name is null, an empty string is used
      name: user.displayName ?? "",
      // If the user's email is null, an empty string is used
      email: user.email ?? '',
    );
  }
}
