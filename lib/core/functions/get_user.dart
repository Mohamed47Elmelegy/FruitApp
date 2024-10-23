import 'dart:convert';
import 'package:frutes_app/Features/auth/domain/Entities/user_entities.dart';
import 'package:frutes_app/core/constants/prefs.dart';
import '../../Features/auth/data/models/user_model.dart';
import '../services/shared_preferences_sengltion.dart';

UserEntities getUser() {
  var jsonString = Prefs.getString(SharedPrefs.userData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
