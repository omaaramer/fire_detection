part of 'auth_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class LoginLoading extends AuthCubitState {}

final class LoginSuccess extends AuthCubitState {}

final class LoginFailure extends AuthCubitState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}
final class RegesterLoading extends AuthCubitState {}

final class RegesterSuccess extends AuthCubitState {}

final class RegesterFailure extends AuthCubitState {
  final String errorMessage;
  RegesterFailure({required this.errorMessage});
}
final class ObscureTextState extends AuthCubitState {}
final class UnobscureTextState extends AuthCubitState {}