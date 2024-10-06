import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../domain/Entities/user_entities.dart';
import '../../../../domain/repositories/auth_repo.dart';
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
    final result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    emit(
      result.fold(
        (failure) => SigninFailure(exception: failure.message),
        (userEntities) => SigninSuccess(userEntities: userEntities),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    emit(
      result.fold(
        (failure) => SigninFailure(exception: failure.message),
        (userEntities) => SigninSuccess(userEntities: userEntities),
      ),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    emit(
      result.fold(
        (failure) => SigninFailure(exception: failure.message),
        (userEntities) => SigninSuccess(userEntities: userEntities),
      ),
    );
  }

  Future<void> signInWithApple() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithApple();
    emit(
      result.fold(
        (failure) => SigninFailure(exception: failure.message),
        (userEntities) => SigninSuccess(userEntities: userEntities),
      ),
    );
  }
}
