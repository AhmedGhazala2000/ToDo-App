import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/utils/api_services.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';

import 'task_details_repo.dart';

class TaskDetailsRepoImpl implements TaskDetailsRepo {
  final ApiServices _apiServices;

  TaskDetailsRepoImpl(this._apiServices);

  @override
  Future<Either<Failures, TaskModel>> getTaskDetails(
      {required String taskId}) async {
    try {
      Response response = await _apiServices.request(
        method: 'GET',
        endPoint: '${EndPoints.todos}/$taskId',
      );
      TaskModel task = TaskModel.fromJson(response.data);
      return right(task);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
