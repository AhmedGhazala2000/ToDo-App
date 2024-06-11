import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/dependency_injection.dart';
import 'package:todo_app/Features/Home/data/repos/task_details_repo/task_details_repo_impl.dart';
import 'package:todo_app/Features/Home/presentation/manager/task_details_cubit/task_details_cubit.dart';

import 'widgets/task_details_view_body.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  static const String id = 'TaskDetailsView';

  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments;
    return BlocProvider(
      create: (context) => TaskDetailsCubit(getIt.get<TaskDetailsRepoImpl>()),
      child: SafeArea(
        child: Scaffold(
          body: TaskDetailsViewBody(taskId: taskId.toString()),
        ),
      ),
    );
  }
}
