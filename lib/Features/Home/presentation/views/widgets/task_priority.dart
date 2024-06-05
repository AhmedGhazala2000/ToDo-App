import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/function/get_priority_color.dart';
import 'package:todo_app/Core/utils/styles.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({super.key, required this.priority});

  final String priority;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/flag.svg',
          colorFilter: ColorFilter.mode(
            getPriorityColor(priority),
            BlendMode.srcIn,
          ),
          width: 16,
        ),
        const SizedBox(width: 4),
        Text(
          priority,
          style: AppStyles.styleMedium12.copyWith(
            color: getPriorityColor(priority),
          ),
        )
      ],
    );
  }
}
