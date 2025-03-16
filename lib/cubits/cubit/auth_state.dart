part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LogInSucsses extends AuthState {}

final class LogInLoading extends AuthState {}

final class LogInFailure extends AuthState {
  final String errorMessage;

  LogInFailure({required this.errorMessage});
}
final class RegisterInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccsess extends AuthState {}

final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}
