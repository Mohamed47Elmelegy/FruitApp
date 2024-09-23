// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../domin/Entities/user_entities.dart';
import '../../../../domin/repositories/auth_repo.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(
    this.authRepo,
  ) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(SigninLoading());
    final user = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    emit(
      user.fold(
        (failure) => SigninFailure(exception: failure.message),
        (userEntities) => SigninSuccess(userEntities: userEntities),
      ),
    );
  }

  // Future<void> signInWithGoogle() async {
  //   emit(SigninLoading());
  //   final user = await authRepo.signInWithGoogle();
  //   emit(
  //     user.fold(
  //       (failure) => SigninError(exception: failure.message),
  //       (userEntities) => SigninSuccess(userEntities: userEntities),
  //     ),
  //   );
  // }

  // Future<void> signInWithFacebook() async {
  //   emit(SigninLoading());
  //   final user = await authRepo.signInWithFacebook();
  //   emit(
  //     user.fold(
  //       (failure) => SigninError(exception: failure.message),
  //       (userEntities) => SigninSuccess(userEntities: userEntities),
  //     ),
  //   );
  // }

  // Future<void> signInWithApple() async {
  //   emit(SigninLoading());
  //   final user = await authRepo.signInWithApple();
  //   emit(
  //     user.fold(
  //       (failure) => SigninError(exception: failure.message),
  //       (userEntities) => SigninSuccess(userEntities: userEntities),
  //     ),
  //   );
  // }
}
