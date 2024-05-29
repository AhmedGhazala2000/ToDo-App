import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/task_image.dart';
import 'build_custom_list_tiles.dart';

class TaskDetailsViewBody extends StatelessWidget {
  const TaskDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 375),
            child: const TaskImage(aspectRatio: 375 / 225),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Grocery Shopping App',
                  style: AppStyles.styleBold24,
                ),
                const SizedBox(height: 8),
                Text(
                  'This application is designed for super shops. By using'
                  'this application they can enlist all their products in one'
                  'place and can deliver. Customers will get a one-stop'
                  'solution for their daily shopping.',
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
                const BuildCustomListTiles(),
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
