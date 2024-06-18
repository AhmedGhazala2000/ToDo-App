import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/Core/utils/api_services.dart';

import '../../errors/failures.dart';
import '../../utils/constant.dart';
import 'upload_image_repo.dart';

class UploadImageRepoImpl implements UploadImageRepo {
  final ApiServices _apiServices;

  UploadImageRepoImpl(this._apiServices);

  @override
  Future<Either<Failures, String>> uploadImage({required File imgFile}) async {
    String fileName = imgFile.path.split('/').last;
    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        imgFile.path,
        filename: fileName,
      )
    });
    try {
      Response response = await _apiServices.request(
        method: 'POST',
        endPoint: EndPoints.uploadImg,
        bodyData: formData,
        contentType: 'multipart/form-data',
      );
      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
      return right(response.data['image']);
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
