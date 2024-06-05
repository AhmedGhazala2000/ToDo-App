import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:todo_app/Core/utils/local_network.dart';

import 'constant.dart';

class ApiServices {
  final Dio _dio;
  final String _baseUrl = 'https://todo.iraqsapp.com';

  ApiServices(this._dio);

  //Post Request
  Future post({
    required String endPoint,
    Object? bodyData,
    String? contentType,
  }) async {
    String token = await _getToken();
    Response response = await _dio.post(
      '$_baseUrl/$endPoint',
      options: Options(
        headers: {
          'Content-Type': contentType ?? 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: bodyData,
    );

    return response;
  }

  //Get Request
  Future<Response> get({
    required String endPoint,
    String? contentType,
  }) async {
    String token = await _getToken();
    Response response = await _dio.get(
      '$_baseUrl/$endPoint',
      options: Options(
        headers: {
          'Content-Type': contentType ?? 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response;
  }

  //Get Token
  Future<String> _getToken() async {
    String? token = CachedNetwork.sharedPref.getString(kAccessToken);
    if (token == null) return '';

    if (JwtDecoder.isExpired(token)) {
      token = await _refreshToken();
    }
    return token;
  }

  //Refresh Token
  Future<String> _refreshToken() async {
    try {
      String refreshToken = CachedNetwork.sharedPref.getString(kRefreshToken)!;
      Response response = await _dio.get(
        '$_baseUrl/${EndPoints.refreshToken}?token=$refreshToken',
      );
      String newToken = response.data['access_token'];
      CachedNetwork.sharedPref.setString(kAccessToken, newToken);
      return newToken;
    } on DioException catch (e) {
      log(e.response?.data["message"].toString() ?? e.toString());
    } catch (e) {
      log(e.toString());
    }
    return '';
  }
}
