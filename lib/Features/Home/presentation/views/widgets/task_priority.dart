import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            getColor(priority),
            BlendMode.modulate,
          ),
          width: 16,
        ),
        const SizedBox(width: 4),
        Text(
          priority,
          style: AppStyles.styleMedium12.copyWith(
            color: getColor(priority),
          ),
        )
      ],
    );
  }

  getColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return const Color(0xff0087FF);
      case 'medium':
        return const Color(0xff5F33E1);
      case 'high':
        return const Color(0xffFF7D53);
    }
  }
}
