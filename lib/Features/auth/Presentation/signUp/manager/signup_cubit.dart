// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../domin/Entities/user_entities.dart';
import '../../../domin/repositories/auth_repo.dart';
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