import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Features/Add/data/models/add_task_model.dart';

abstract class AddTaskRepo {
  Future<Either<Failures, void>> addTask({required AddTaskModel addTaskModel});
}
