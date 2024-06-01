part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<TaskModel> todos;

  HomeSuccessState(this.todos);
}

final class HomeFailureState extends HomeState {
  final String errMessage;

  HomeFailureState(this.errMessage);
}
