part of 'task_details_cubit.dart';

@immutable
sealed class TaskDetailsState {}

final class TaskDetailsInitialState extends TaskDetailsState {}

final class TaskDetailsLoadingState extends TaskDetailsState {}

final class TaskDetailsSuccessState extends TaskDetailsState {
  final TaskModel task;

  TaskDetailsSuccessState({required this.task});
}

final class TaskDetailsFailureState extends TaskDetailsState {
  final String errMessage;

  TaskDetailsFailureState(this.errMessage);
}
