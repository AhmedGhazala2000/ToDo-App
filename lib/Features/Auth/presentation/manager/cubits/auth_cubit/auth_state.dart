part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

// Register States
final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterFailureState extends AuthState {
  final String errMessage;

  RegisterFailureState(this.errMessage);
}

// Login States
final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {
  final AuthResponseModel authResponseModel;

  LoginSuccessState(this.authResponseModel);
}

final class LoginFailureState extends AuthState {
  final String errMessage;

  LoginFailureState(this.errMessage);
}

// Logout States
final class LogoutLoadingState extends AuthState {}

final class LogoutSuccessState extends AuthState {}

final class LogoutFailureState extends AuthState {
  final String errMessage;

  LogoutFailureState(this.errMessage);
}
