// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/constants/backend_point.dart';
import 'package:frutes_app/core/errors/custom_exception.dart';
import 'package:frutes_app/core/services/database_service.dart';
import '../../../../core/config/ansicolor.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domin/Entities/user_entities.dart';
import '../../domin/repositories/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirbaseAuthService firbaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
    this.firbaseAuthService,
    this.databaseService,
  );

  @override
  Future<Either<Failure, UserEntities>> creatUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      var user = await firbaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntities(
        uId: user.uid,
        name: name,
        email: email,
      );
      addUserData(
        user: userEntity,
      );

      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    } catch (e) {
      log(DebugConsoleMessages.error(
          'An Exception occurred in AuthRepoImpl.creatUserWithEmailAndPassword: $e'));
      return Left(
        ServerFailure(
          'حدث خطأ  في الاتصال بالسيرفر, حاول مرة ثانية',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firbaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    } catch (e) {
      log(DebugConsoleMessages.error(
          'An Exception occurred in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}'));
      // Return a Left containing a ServerFailure if the operation fails.
      return Left(
        ServerFailure(
          'حدث خطأ  في الاتصال بالسيرفر, حاول مرة ثانية',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithGoogle() async {
    try {
      var user = await firbaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log(
        DebugConsoleMessages.error(
            'An Exception occurred in AuthRepoImpl.signInWithGoogle: ${e.toString()}'),
      );
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithFacebook() async {
    try {
      var user = await firbaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log(
        DebugConsoleMessages.error(
            'An Exception occurred in AuthRepoImpl.signInWithFacebook: ${e.toString()}'),
      );
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future addUserData({
    required UserEntities user,
  }) async {
    await databaseService.addData(
      path: BackendPoint.addDataToUserCollection,
      data: user.toMap(),
    );
  }
}
