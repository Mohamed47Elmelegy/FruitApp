import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/Entities/user_entities.dart';
import '../../../domain/repositories/auth_repo.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  // The scientific name for this line is "Extends Cubit class with SignupState type"
  SignupCubit(
    this.authRepo,
  ) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    emit(SignupLoading());

    final user = await authRepo.creatUserWithEmailAndPassword(
      name,
      email,
      password,
    );
    emit(
      user.fold(
        (failure) => SignupFailure(exception: failure.message),
        (userEntities) => SignupSuccess(userEntities: userEntities),
      ),
    );
  }
}
