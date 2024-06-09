import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/build_custom_app_bar.dart';
import 'package:todo_app/Core/utils/dependency_injection.dart';
import 'package:todo_app/Features/Add/data/repos/add_task_repo_impl.dart';
import 'package:todo_app/Features/Add/presentation/manager/add_task_cubit/add_task_cubit.dart';

import 'widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  static const String id = 'AddTaskView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(getIt.get<AddTaskRepoImpl>()),
      child: SafeArea(
        child: Scaffold(
          appBar: buildCustomAppBar(context, title: 'Add new Task'),
          body: const AddTaskViewBody(),
        ),
      ),
    );
  }
}
