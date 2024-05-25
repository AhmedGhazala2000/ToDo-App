part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterFailureState extends AuthState {
  final String errMessage;

  RegisterFailureState(this.errMessage);
}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailureState extends AuthState {
  final String errMessage;

  LoginFailureState(this.errMessage);
}
