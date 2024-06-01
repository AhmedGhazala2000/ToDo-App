import 'package:dartz/dartz.dart';
import 'package:todo_app/Core/errors/failures.dart';

import '../models/task_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<TaskModel>>> fetchAllTasks(
      {required String pageNumber});
}
