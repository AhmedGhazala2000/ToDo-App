import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/data/repos/task_details_repo/task_details_repo.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit(this._taskDetailsRepo) : super(TaskDetailsInitialState());

  final TaskDetailsRepo _taskDetailsRepo;

  Future getTask({required String taskId}) async {
    emit(TaskDetailsLoadingState());
    final result = await _taskDetailsRepo.getTaskDetails(taskId: taskId);
    result.fold(
      (failure) => emit(TaskDetailsFailureState(failure.errMessage)),
      (success) {
        emit(TaskDetailsSuccessState(task: success));
      },
    );
  }
}
