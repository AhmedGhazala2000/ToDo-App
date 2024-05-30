import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, AuthResponseModel>> register(RegisterRequestModel model);

  Future<Either<Failures, AuthResponseModel>> login(LoginRequestModel model);
  Future<Either<Failures, void>> logout({required String token});
}
