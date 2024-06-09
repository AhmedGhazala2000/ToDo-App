import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';

abstract class DeleteTaskRepo {
  Future<Either<Failures, void>> deleteTask({required String taskId});
}
