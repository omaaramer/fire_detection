part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthCubitInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}
final class RegesterLoading extends AuthState {}

final class RegesterSuccess extends AuthState {}

final class RegesterFailure extends AuthState {
  final String errorMessage;
  RegesterFailure({required this.errorMessage});
}
final class ObscureTextState extends AuthState {}
final class UnobscureTextState extends AuthState {}