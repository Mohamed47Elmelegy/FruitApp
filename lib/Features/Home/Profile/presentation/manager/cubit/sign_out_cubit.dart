import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/errors/custom_exception.dart';
import '../../../../../auth/domain/repositories/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.authRepo) : super(SignOutInitial());
  final AuthRepo authRepo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await authRepo.signOut();
      emit(SignOutSuccess(
        
      ));
    } on CustomException catch (e) {
      emit(SignOutFailure(exception: e.message));
    }
  }
}

