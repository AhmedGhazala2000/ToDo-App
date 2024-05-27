import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'task_image.dart';
import 'task_priority.dart';
import 'task_status.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 64),
            child: const TaskImage(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Grocery Shopping App',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleBold16,
                      ),
                    ),
                    SizedBox(width: 8),
                    TaskStatus(status: 'Waiting'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '''This application is designed for super shops. By using 
                  this application they can enlist all their products in one
                  place and can deliver. Customers will get a one-stop
                  solution for their daily shopping.''',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kSecondColor.withOpacity(0.6),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TaskPriority(priority: 'Medium'),
                    Text(
                      '30/12/2022',
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
          const SizedBox(width: 8),
          Transform.translate(
            offset: const Offset(0, -22),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
