import 'package:flutter/material.dart';
import 'widgets/build_custom_app_bar.dart';
import 'widgets/custom_icon_button.dart';

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
            padding: EdgeInsets.only(right: 8),
            child: CustomIconButton(),
          ),
        ),
      ),
    );
  }
}
