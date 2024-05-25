import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/utils/api_services.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Features/Auth/data/models/auth_response_model.dart';
import 'package:todo_app/Features/Auth/data/models/login_request_model.dart';
import 'package:todo_app/Features/Auth/data/models/register_request_model.dart';
import 'package:todo_app/Features/Auth/data/repos/auth_repo.dart';

class RegisterRepoImpl implements AuthRepo {
  final ApiServices _apiService;

  RegisterRepoImpl(ApiServices apiService) : _apiService = apiService;

  @override
  Future<Either<Failures, void>> register(RegisterRequestModel model) async {
    try {
      var response = await _apiService.post(
        endPoint: EndPoints.register,
        bodyData: model.toJson(),
      );
      log(response.data.toString());
      return right(null);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AuthResponseModel>> login(
      LoginRequestModel model) async {
    try {
      var response = await _apiService.post(
        endPoint: EndPoints.login,
        bodyData: model.toJson(),
      );
      AuthResponseModel data = AuthResponseModel.fromJson(response.data);
      log(data.toString());
      return right(data);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
