import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';

import 'custom_popup_menu_button.dart';
import 'task_image.dart';
import 'task_priority.dart';
import 'task_status.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 64),
            child: TaskImage(
              imageUrl: '$kLinkImageRoot/${task.image}',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title!,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleBold16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    TaskStatus(status: task.status!),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    task.desc!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kSecondColor.withOpacity(0.6),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TaskPriority(priority: task.priority!),
                    Text(
                      DateFormat('d/M/yyyy').format(task.createdAt!),
                      style: AppStyles.styleMedium12.copyWith(
                        fontWeight: FontWeight.normal,
                        color: kSecondColor.withOpacity(.6),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          Transform.translate(
            offset: const Offset(0, -22),
            child: CustomPopupMenuButton(task: task),
          ),
        ],
      ),
    );
  }
}
