import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/widgets/custom_circular_indicator.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/task_widget.dart';

import '../task_details_view.dart';

class TaskWidgetListView extends StatelessWidget {
  const TaskWidgetListView({super.key, required this.todos});

  final List<TaskModel> todos;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: context.read<HomeCubit>().hasMoreTasks != false
          ? todos.length + 1
          : todos.length,
      itemBuilder: (context, index) {
        return index >= todos.length
            ? const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: CustomCircularIndicator(color: Colors.blue, size: 25),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    TaskDetailsView.id,
                    arguments: todos[index].taskId,
                  );
                },
                child: TaskWidget(task: todos[index]),
              );
      },
    );
  }
}
