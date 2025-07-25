part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String successMessage;
  AuthSuccess(this.successMessage);
}
final class AuthFailure extends AuthState {
  final String failureMessage;
  AuthFailure(this.failureMessage);
}
