import 'package:dartz/dartz.dart';

import 'package:frutes_app/core/errors/failure.dart';

import 'package:frutes_app/domin/Entities/user_entities.dart';

import '../../domin/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntities>> creatUserWithEmailAndPassword(
      String email, String password) {
    // TODO: implement creatUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
