import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';

class TaskStatus extends StatelessWidget {
  const TaskStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: getStatusColor(status)),
      child: Text(
        status,
        style: AppStyles.styleMedium12.copyWith(
          color: getStatusTextColor(status),
        ),
      ),
    );
  }

  getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'waiting':
        return const Color(0xffFFE4F2);
      case 'inprogress':
        return const Color(0xffF0ECFF);
      case 'finished':
        return const Color(0xffE3F2FF);
    }
  }
}
