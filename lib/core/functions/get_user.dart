import 'package:frutes_app/Features/auth/domain/Entities/user_entities.dart';
import '../../Features/auth/data/models/user_model.dart';
import 'package:hive/hive.dart';

UserEntities getUser() {
  var userBox = Hive.box<UserModel>('userBox');
  var userEntity = userBox.get('currentUser');
  if (userEntity != null) {
    return userEntity;
  } else {
    return UserEntities(uId: '', name: '', email: '');
  }
}
