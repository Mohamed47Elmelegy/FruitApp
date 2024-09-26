// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:frutes_app/core/errors/custom_exception.dart';

import '../../../../core/config/ansicolor.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domin/Entities/user_entities.dart';
import '../../domin/repositories/auth_repo.dart';
import '../models/user_model.dart';

/// This class implements the [AuthRepo] interface. It uses a [FirbaseAuthService]
/// to create new users.
class AuthRepoImpl extends AuthRepo {
  /// The service that performs authentication operations using Firebase.
  final FirbaseAuthService firbaseAuthService;

  /// Constructor that takes a [FirbaseAuthService] as an argument.
  AuthRepoImpl(
    this.firbaseAuthService,
  );

  /// Creates a new user with the given [name], [email], and [password].
  ///
  /// This method uses [FirbaseAuthService.createUserWithEmailAndPassword] to
  /// create the user. If the operation is successful, it returns a [Right]
  /// containing a [UserEntities] object. Otherwise, it returns a [Left]
  /// containing a [Failure].
  @override
  Future<Either<Failure, UserEntities>> creatUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      var user = await firbaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If the operation is successful, return a Right containing a
      // UserModel object.
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      // Return a Left containing a ServerFailure if the operation fails.
      return Left(
        ServerFailure(
          e.message,
        ),
      );
    } catch (e) {
      log(DebugConsoleMessages.error(
          'An Exception occurred in AuthRepoImpl.creatUserWithEmailAndPassword: $e'));
      // Return a Left containing a ServerFailure if the operation fails.
      return Left(
        ServerFailure(
          'حدث خطأ  في الاتصال بالسيرفر, حاول مرة ثانية',
        ),
      );
    }
  }

  /// Signs in a user with the given [email] and [password].
  ///
  /// This method uses [FirbaseAuthService.signInWithEmailAndPassword] to
  /// sign in the user. If the operation is successful, it returns a [Right]
  /// containing a [UserEntities] object. Otherwise, it returns a [Left]
  /// containing a [Failure].
  @override
  Future<Either<Failure, UserEntities>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firbaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      ); // If the operation is successful, return a Right containing a  UserModel object.

      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      // Return a Left containing a ServerFailure if the operation fails.
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
}
