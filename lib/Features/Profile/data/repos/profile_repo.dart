import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Features/Profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failures, UserModel>> getProfile({required String token});
}
