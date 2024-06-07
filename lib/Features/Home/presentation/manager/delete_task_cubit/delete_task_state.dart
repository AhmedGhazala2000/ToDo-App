part of 'delete_task_cubit.dart';

@immutable
sealed class DeleteTaskState {}

final class DeleteTaskInitialState extends DeleteTaskState {}

final class DeleteTaskLoadingState extends DeleteTaskState {}

final class DeleteTaskSuccessState extends DeleteTaskState {}

final class DeleteTaskFailureState extends DeleteTaskState {
  final String errMessage;

  DeleteTaskFailureState(this.errMessage);
}
