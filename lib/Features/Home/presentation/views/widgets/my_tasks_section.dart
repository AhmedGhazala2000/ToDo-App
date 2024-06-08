import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';

import 'select_tasks_items_list_view.dart';
import 'task_widget_list_view.dart';

class MyTasksSection extends StatelessWidget {
  const MyTasksSection({super.key, this.controller, required this.todos});

  final ScrollController? controller;
  final List<TaskModel> todos;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),
        const SliverToBoxAdapter(
          child: Opacity(
            opacity: 0.6,
            child: Text('My Tasks', style: AppStyles.styleBold16),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: SelectTasksItemsListView(),
          ),
        ),
        if (todos.isNotEmpty)
          TaskWidgetListView(todos: todos)
        else
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  'No tasks yet',
                  style: AppStyles.styleBold16,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
