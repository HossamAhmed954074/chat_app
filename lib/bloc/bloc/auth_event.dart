part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LogInUser extends AuthEvent {
  final String? email, password;

  LogInUser({this.email, this.password});
}

class RegisterUser extends AuthEvent {
  final String? email, password;

  RegisterUser({this.email, this.password});
}