import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'https://todo.iraqsapp.com';

  ApiService(this._dio);

  Future<Response> post({
    required String endPoint,
    required body,
    required String token,
    String? contentType,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl/$endPoint',
      data: body,
      options: Options(
        contentType: contentType,
        headers: {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }
}
