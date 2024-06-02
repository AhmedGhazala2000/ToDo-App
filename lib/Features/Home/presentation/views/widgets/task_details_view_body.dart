import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/task_image.dart';

import 'build_custom_list_tiles.dart';

class TaskDetailsViewBody extends StatelessWidget {
  const TaskDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TaskModel task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return SingleChildScrollView(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 375),
            child: TaskImage(
              aspectRatio: 375 / 225,
              imageUrl: task.image ??
                  'https://th.bing.com/th/id/OIP.IcOIf38lUmebdO7EEKkRmgHaKQ?rs=1&pid=ImgDetMain',
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
