import 'package:flutter/material.dart';
import '../../../../Core/function/build_custom_app_bar.dart';
import 'widgets/custom_popup_menu_button.dart';
import 'widgets/task_details_view_body.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  static const String id = 'TaskDetailsView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(
          context,
          title: 'Task Details',
          actions: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CustomPopupMenuButton(),
          ),
        ),
        body: const TaskDetailsViewBody(),
      ),
    );
  }
}
