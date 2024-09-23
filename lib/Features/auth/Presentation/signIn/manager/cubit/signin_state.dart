part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninFailure extends SigninState {
  final String exception;
  SigninFailure({required this.exception});
}

final class SigninSuccess extends SigninState {
  final UserEntities userEntities;
  SigninSuccess({required this.userEntities});
}
