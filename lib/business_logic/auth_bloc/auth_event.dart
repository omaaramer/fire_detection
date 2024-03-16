part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvant extends AuthEvent {}

class RegisterEvant extends AuthEvent {
  final String email;
  final String password;

  RegisterEvant({required this.email, required this.password});
}
