import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/models/task_request_model.dart';

abstract class AddTaskRepo {
  Future<Either<Failures, void>> addTask(
      {required TaskRequestModel addTaskModel});
}
