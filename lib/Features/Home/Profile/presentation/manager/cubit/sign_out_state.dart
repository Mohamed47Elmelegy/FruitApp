part of 'sign_out_cubit.dart';

@immutable
sealed class SignOutState {}

final class SignOutInitial extends SignOutState {}

final class SignOutLoading extends SignOutState {}

final class SignOutFailure extends SignOutState {
  final String exception;
  SignOutFailure({required this.exception});
}

final class SignOutSuccess extends SignOutState {
  
  
  SignOutSuccess();
}
