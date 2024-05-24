import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';

import '../models/register_request_model.dart';

abstract class RegisterRepo {
  Future<Either<Failures, void>> register(RegisterRequestModel model);
}