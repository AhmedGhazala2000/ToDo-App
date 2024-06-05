part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileSuccessState extends ProfileState {
  final UserModel userModel;

  ProfileSuccessState(this.userModel);
}

final class ProfileFailureState extends ProfileState {
  final String errMessage;

  ProfileFailureState(this.errMessage);
}
