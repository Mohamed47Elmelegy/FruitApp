part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntities userEntities;

  SignupSuccess({required this.userEntities});
}

final class SignupFailure extends SignupState {
  final String exception;

  SignupFailure({required this.exception});
}
