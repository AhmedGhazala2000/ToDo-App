part of 'edit_task_cubit.dart';

@immutable
sealed class EditTaskState {}

final class EditTaskInitialState extends EditTaskState {}

final class EditTaskLoadingState extends EditTaskState {}

final class EditTaskSuccessState extends EditTaskState {}

final class EditTaskFailureState extends EditTaskState {
  final String errMessage;

  EditTaskFailureState(this.errMessage);
}
