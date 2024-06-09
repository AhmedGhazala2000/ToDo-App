import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Add/data/models/add_task_model.dart';
import 'package:todo_app/Features/Add/data/repos/add_task_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._addTaskRepo) : super(AddTaskInitialState());
  final AddTaskRepo _addTaskRepo;
  String image = '';

  Future addTask({required AddTaskModel addTaskModel}) async {
    emit(AddTaskLoadingState());
    final result = await _addTaskRepo.addTask(addTaskModel: addTaskModel);
    result.fold(
      (failure) => emit(AddTaskFailureState(failure.errMessage)),
      (success) => emit(AddTaskSuccessState()),
    );
  }
}
