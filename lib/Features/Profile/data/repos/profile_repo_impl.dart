import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/utils/api_services.dart';
import 'package:todo_app/Core/utils/constant.dart';

import 'package:todo_app/Features/Profile/data/models/user_model.dart';

import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiServices _apiServices;

  ProfileRepoImpl(ApiServices apiServices) : _apiServices = apiServices;

  @override
  Future<Either<Failures, UserModel>> getProfile(
      {required String token}) async {
    try {
      Response response = await _apiServices.get(
        endPoint: EndPoints.profile,
        token: token,
      );
      var userData = UserModel.fromJson(response.data);
      return right(userData);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
