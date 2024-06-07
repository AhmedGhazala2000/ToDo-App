import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';

import 'build_custom_list_tiles.dart';

class TaskDetailsViewBody extends StatelessWidget {
  const TaskDetailsViewBody({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 375),
            child: AspectRatio(
              aspectRatio: 1.5 / 1,
              child: Image.file(
                task.image!,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title!,
                  style: AppStyles.styleBold24,
                ),
                const SizedBox(height: 8),
                Text(
                  task.desc!,
                  style: TextStyle(
                    height: 1.4,
                    color: kSecondColor.withOpacity(.6),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.5),
            child: Column(
              children: [
                BuildCustomListTiles(task: task),
                const SizedBox(height: 16),
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/images/barcode_img.png'),
                ),
                const SizedBox(height: 30)
              ],
            ),
          )
        ],
      ),
    );
  }
}
