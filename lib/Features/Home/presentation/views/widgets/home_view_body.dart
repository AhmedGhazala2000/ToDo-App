import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'custom_home_app_bar.dart';
import 'select_tasks_items_list_view.dart';
import 'task_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHomeAppBar(),
          SizedBox(height: 24),
          Opacity(
            opacity: 0.6,
            child: Text('My Tasks', style: AppStyles.styleBold16),
          ),
          SizedBox(height: 16),
          SelectTasksItemsListView(),
          SizedBox(height: 16),
          TaskWidget(),
        ],
      ),
    );
  }
}

