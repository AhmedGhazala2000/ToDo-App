import 'package:flutter/material.dart';
import 'package:todo_app/Core/function/build_custom_app_bar.dart';

import 'widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  static const String id = 'AddTaskView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'Add new Task'),
        body: const AddTaskViewBody(),
      ),
    );
  }
}
