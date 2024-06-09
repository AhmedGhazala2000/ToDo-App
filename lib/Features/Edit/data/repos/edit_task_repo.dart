import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';

import '../models/edit_task_model.dart';

abstract class EditTaskRepo {
  Future<Either<Failures, void>> editTask(
      {required EditTaskModel editTaskModel, required String taskId});
}
