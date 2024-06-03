import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/utils/api_services.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices _apiServices;

  HomeRepoImpl(this._apiServices);

  @override
  Future<Either<Failures, List<TaskModel>>> fetchAllTasks(
      {required int pageNumber}) async {
    try {
      Response response = await _apiServices.get(
        endPoint: '${EndPoints.todos}?page=$pageNumber',
      );
      if (response.data.isEmpty) return right([]);
      List<TaskModel> todos = [];
      for (var task in response.data) {
        todos.add(TaskModel.fromJson(task));
      }
      return right(todos);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
