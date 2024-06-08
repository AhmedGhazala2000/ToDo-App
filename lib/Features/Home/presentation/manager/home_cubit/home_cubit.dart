import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitialState());

  final HomeRepo _homeRepo;
  int _currentPage = 1;
  bool? hasMoreTasks;

  //Get All Tasks
  Future<void> fetchAllTasks({required String status}) async {
    if (hasMoreTasks == false) return;

    emit(_currentPage == 1 ? HomeLoadingState() : HomeLoadingPaginationState());

    final result = await _homeRepo.fetchAllTasks(pageNumber: _currentPage);

    result.fold(
      (failure) {
        emit(_currentPage == 1
            ? HomeFailureState(failure.errMessage)
            : HomeFailurePaginationState(failure.errMessage));
      },
      (success) {
        //Filter tasks by status
        if (status.toLowerCase() != 'all') {
          final filteredTasks = success
              .where(
                  (task) => task.status?.toLowerCase() == status.toLowerCase())
              .toList();
          success = filteredTasks;
        }
        //Check if there are more tasks for pagination
        if (success.isEmpty || success.length < 20) {
          hasMoreTasks = false;
        } else {
          _currentPage++;
        }
        emit(HomeSuccessState(tasks: success));
      },
    );
  }
}
