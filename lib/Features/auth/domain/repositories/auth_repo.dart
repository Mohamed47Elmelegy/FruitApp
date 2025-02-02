import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../Entities/user_entities.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntities>> creatUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<void> sendEmailVerification();

  Future<Either<Failure, UserEntities>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future addUserData({required UserEntities user});
  Future saveUserData({required UserEntities user});
  Future<UserEntities> getUserData({required String userId});
  Future<Either<Failure, UserEntities>> signInWithGoogle();

  Future<Either<Failure, UserEntities>> signInWithApple();

  Future<Either<Failure, UserEntities>> signInWithFacebook();
  Future signOut();
}
