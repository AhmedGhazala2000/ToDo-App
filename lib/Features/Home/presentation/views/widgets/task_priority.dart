import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/utils/app_images.dart';
import 'package:todo_app/Core/utils/app_styles.dart';
import 'package:todo_app/Core/utils/constant.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({super.key, required this.priority});

  final String priority;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.flag,
          colorFilter: ColorFilter.mode(
            getPriorityColor(priority),
            BlendMode.srcIn,
          ),
          width: 16,
        ),
        const SizedBox(width: 4),
        Text(
          priority,
          style: AppStyles.styleMedium12(context).copyWith(
            color: getPriorityColor(priority),
          ),
        )
      ],
    );
  }
}
