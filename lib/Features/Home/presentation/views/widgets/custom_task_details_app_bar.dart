import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/utils/styles.dart';

import '../../../data/models/task_model.dart';
import 'custom_popup_menu_button.dart';

class CustomTaskDetailsAppBar extends StatelessWidget {
  const CustomTaskDetailsAppBar({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset('assets/images/arrow_left.svg'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 4),
              const Text(
                'Task Details',
                style: AppStyles.styleBold16,
              ),
            ],
          ),
          CustomPopupMenuButton(task: task),
        ],
      ),
    );
  }
}
