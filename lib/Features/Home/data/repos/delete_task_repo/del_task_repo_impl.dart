import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/utils/api_services.dart';
import 'package:todo_app/Core/utils/constant.dart';

import 'del_task_repo.dart';

class DeleteTaskRepoImpl implements DeleteTaskRepo {
  final ApiServices _apiServices;

  DeleteTaskRepoImpl(this._apiServices);

  @override
  Future<Either<Failures, void>> deleteTask({required String taskId}) async {
    try {
      await _apiServices.delete(
        endPoint: '${EndPoints.todos}/$taskId',
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
