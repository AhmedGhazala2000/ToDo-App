import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/models/task_request_model.dart';
import 'package:todo_app/Core/utils/api_services.dart';
import 'package:todo_app/Core/utils/constant.dart';

import 'add_task_repo.dart';

class AddTaskRepoImpl implements AddTaskRepo {
  final ApiServices _apiServices;

  AddTaskRepoImpl(this._apiServices);

  @override
  Future<Either<Failures, void>> addTask(
      {required TaskRequestModel addTaskModel}) async {
    try {
      await _apiServices.post(
        endPoint: EndPoints.todos,
        bodyData: addTaskModel.toJson(),
      );

      return right(null);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
