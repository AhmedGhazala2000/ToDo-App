import 'package:flutter/material.dart';

import 'add_image_widget.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            SizedBox(height: 24),
            AddImageWidget(),
          ],
        ),
      ),
    );
  }
}
