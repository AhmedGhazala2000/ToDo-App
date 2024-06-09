import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Edit/data/models/edit_task_model.dart';
import 'package:todo_app/Features/Edit/data/repos/edit_task_repo.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(this._editTaskRepo) : super(EditTaskInitialState());
  final EditTaskRepo _editTaskRepo;

  Future editTask(
      {required EditTaskModel editTaskModel, required String taskId}) async {
    emit(EditTaskLoadingState());
    final result = await _editTaskRepo.editTask(
        editTaskModel: editTaskModel, taskId: taskId);
    result.fold(
      (failure) => emit(EditTaskFailureState(failure.errMessage)),
      (success) => emit(EditTaskSuccessState()),
    );
  }
}
