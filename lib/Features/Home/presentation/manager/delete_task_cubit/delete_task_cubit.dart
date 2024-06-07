import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this._deleteTaskRepo) : super(DeleteTaskInitialState());

  final HomeRepo _deleteTaskRepo;

  Future deleteTask({required String taskId}) async {
    emit(DeleteTaskLoadingState());
    final result = await _deleteTaskRepo.deleteTask(taskId: taskId);
    result.fold(
      (failure) => emit(DeleteTaskFailureState(failure.errMessage)),
      (success) => emit(DeleteTaskSuccessState()),
    );
  }
}
