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

class AuthRepoImpl implements AuthRepo {
  final ApiServices _apiService;

  AuthRepoImpl(ApiServices apiService) : _apiService = apiService;

  // Register User
  @override
  Future<Either<Failures, AuthResponseModel>> register(
      RegisterRequestModel model) async {
    try {
      var response = await _apiService.post(
        endPoint: EndPoints.register,
        bodyData: model.toJson(),
      );
      AuthResponseModel data = AuthResponseModel.fromJson(response.data);
      return right(data);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  // Login User
  @override
  Future<Either<Failures, AuthResponseModel>> login(
      LoginRequestModel model) async {
    try {
      var response = await _apiService.post(
        endPoint: EndPoints.login,
        bodyData: model.toJson(),
      );
      AuthResponseModel data = AuthResponseModel.fromJson(response.data);
      return right(data);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  // Logout
  @override
  Future<Either<Failures, void>> logout({required String token}) async {
    try {
      await _apiService.post(
        endPoint: EndPoints.logout,
        token: token,
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
