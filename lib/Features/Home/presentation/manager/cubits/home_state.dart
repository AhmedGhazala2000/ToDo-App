part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {}

final class HomeFailureState extends HomeState {
  final String errMessage;

  HomeFailureState(this.errMessage);
}
