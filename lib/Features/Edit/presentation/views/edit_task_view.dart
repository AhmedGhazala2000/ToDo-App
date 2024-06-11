import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/build_custom_app_bar.dart';
import 'package:todo_app/Core/utils/dependency_injection.dart';

import '../../data/repos/edit_task_repo_impl.dart';
import '../manager/edit_task_cubit/edit_task_cubit.dart';
import 'widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  static const String id = 'EditView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTaskCubit(getIt.get<EditTaskRepoImpl>()),
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(context, title: 'Edit the Task'),
          body: const EditTaskViewBody(),
        ),
      ),
    );
  }
}
