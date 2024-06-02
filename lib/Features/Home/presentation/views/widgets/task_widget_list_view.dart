import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/presentation/manager/cubits/home_cubit.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/task_widget.dart';

import '../task_details_view.dart';

class TaskWidgetListView extends StatelessWidget {
  const TaskWidgetListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskModel> todos = context.read<HomeCubit>().tasks;
    return SliverList.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              TaskDetailsView.id,
              arguments: todos[index],
            );
          },
          child: TaskWidget(task: todos[index]),
        );
      },
    );
  }
}
