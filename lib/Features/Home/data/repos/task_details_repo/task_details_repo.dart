import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';

import '../../models/task_model.dart';

abstract class TaskDetailsRepo {
  Future<Either<Failures, TaskModel>> getTaskDetails({required String taskId});
}
