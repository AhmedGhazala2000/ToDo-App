import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/models/task_request_model.dart';
import 'package:todo_app/Core/utils/api_services.dart';
import 'package:todo_app/Core/utils/constant.dart';

import 'edit_task_repo.dart';

class EditTaskRepoImpl implements EditTaskRepo {
  final ApiServices _apiServices;

  EditTaskRepoImpl(this._apiServices);

  @override
  Future<Either<Failures, void>> editTask(
      {required TaskRequestModel editTaskModel, required String taskId}) async {
    try {
      await _apiServices.post(
        endPoint: '${EndPoints.todos}/$taskId',
        bodyData: editTaskModel.toJson(),
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
