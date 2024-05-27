import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'task_image.dart';

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
        ],
      ),
    );
  }
}
