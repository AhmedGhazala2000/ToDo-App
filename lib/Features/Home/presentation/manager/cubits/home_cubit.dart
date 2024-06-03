import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  int _currentPage = 1;
  bool hasMoreTasks = true;
  int trigger = 1;

  Future fetchAllTasks() async {
    if (!hasMoreTasks) return;

    emit(
      _currentPage == 1 ? HomeLoadingState() : HomeLoadingPaginationState(),
    );

    final result = await _homeRepo.fetchAllTasks(pageNumber: _currentPage);
    result.fold(
      (failure) {
        emit(
          _currentPage == 1
              ? HomeFailureState(failure.errMessage)
              : HomeFailurePaginationState(failure.errMessage),
        );
      },
      (success) {
        if (success.isEmpty) {
          hasMoreTasks = false;
        } else {
          _currentPage++;
        }
        emit(HomeSuccessState(tasks: success));
      },
    );
  }
}
