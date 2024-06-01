import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;

  Future fetchAllTasks({required String pageNumber}) async {
    emit(HomeLoadingState());
    final result = await _homeRepo.fetchAllTasks(pageNumber: pageNumber);
    result.fold(
      (failure) => emit(HomeFailureState(failure.errMessage)),
      (success) => emit(HomeSuccessState(success)),
    );
  }
}
