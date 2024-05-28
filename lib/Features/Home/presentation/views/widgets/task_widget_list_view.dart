import 'package:flutter/material.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/task_widget.dart';

import '../task_details_view.dart';

class TaskWidgetListView extends StatelessWidget {
  const TaskWidgetListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, TaskDetailsView.id);
          },
          child: const TaskWidget(),
        );
      },
    );
  }
}
