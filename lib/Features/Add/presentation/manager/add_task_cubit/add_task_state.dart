part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitialState extends AddTaskState {}

final class AddTaskLoadingState extends AddTaskState {}

final class AddTaskSuccessState extends AddTaskState {}

final class AddTaskFailureState extends AddTaskState {
  final String errMessage;

  AddTaskFailureState(this.errMessage);
}
