import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';

import 'build_custom_list_tiles.dart';
import 'custom_popup_menu_button.dart';
import 'custom_task_details_app_bar.dart';

class DisplayTaskDetails extends StatelessWidget {
  const DisplayTaskDetails({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            CustomTaskDetailsAppBar(
              widget: CustomPopupMenuButton(task: task),
            ),
            AspectRatio(
              aspectRatio: 1.5 / 1,
              child: Image.file(
                task.image!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
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
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  BuildCustomListTiles(task: task),
                  const SizedBox(height: 16),
                  QrImageView(
                    padding: const EdgeInsets.all(20),
                    data: task.taskId!,
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
