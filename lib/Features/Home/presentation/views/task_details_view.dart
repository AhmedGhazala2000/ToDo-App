import 'package:flutter/material.dart';
import 'package:todo_app/Core/function/build_custom_app_bar.dart';

import '../../data/models/task_model.dart';
import 'widgets/custom_popup_menu_button.dart';
import 'widgets/task_details_view_body.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  static const String id = 'TaskDetailsView';

  @override
  Widget build(BuildContext context) {
    TaskModel task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(
          context,
          title: 'Task Details',
          actions: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CustomPopupMenuButton(task: task),
          ),
        ),
        body: TaskDetailsViewBody(task: task),
      ),
    );
  }
}
