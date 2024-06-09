import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/models/task_request_model.dart';

abstract class EditTaskRepo {
  Future<Either<Failures, void>> editTask(
      {required TaskRequestModel editTaskModel, required String taskId});
}
