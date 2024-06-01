import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/styles.dart';

import 'select_tasks_items_list_view.dart';
import 'task_widget_list_view.dart';

class MyTasksSection extends StatelessWidget {
  const MyTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),
        SliverToBoxAdapter(
          child: Opacity(
            opacity: 0.6,
            child: Text('My Tasks', style: AppStyles.styleBold16),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: SelectTasksItemsListView(),
          ),
        ),
        TaskWidgetListView(),
      ],
    );
  }
}
