import 'package:dartz/dartz.dart';
import 'package:frutes_app/domin/Entities/user_entities.dart';

import '../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntities>> creatUserWithEmailAndPassword(
      String email, String password);
}
