part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class RegisterEvent extends AuthEvent{
  final String username;
  final String email;
  final String password;

  RegisterEvent(this.username, this.email, this.password);
}

class LoginEvent extends AuthEvent{
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}


