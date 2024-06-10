import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/widgets/custom_priority_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_status_list_tile.dart';
import 'package:todo_app/Core/widgets/show_date_piker.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';

import 'custom_list_tile.dart';

class BuildCustomListTiles extends StatefulWidget {
  const BuildCustomListTiles({super.key, required this.task});

  final TaskModel task;

  @override
  State<BuildCustomListTiles> createState() => _BuildCustomListTilesState();
}

class _BuildCustomListTilesState extends State<BuildCustomListTiles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: const Text(
            'End Date',
            style: TextStyle(
              fontSize: 9,
              color: Color(0xff6E6A7C),
            ),
          ),
          subtitle: Text(
            DateFormat('d MMMM, yyyy').format(widget.task.createdAt!),
            style: const TextStyle(color: kSecondColor),
          ),
          trailing: ShowDatePiker(
            selectedDate: widget.task.createdAt!,
            onValue: (value) {
              if (value != null && value != widget.task.createdAt) {
                setState(() {
                  widget.task.createdAt = value;
                });
              }
            },
          ),
        ),
        const SizedBox(height: 8),
        CustomStatusListTile(
          status: widget.task.status!,
          onChanged: (value) {
            setState(() {
              widget.task.status = value!;
            });
          },
        ),
        const SizedBox(height: 8),
        CustomPriorityListTile(
          priority: widget.task.priority!,
          onChanged: (value) {
            setState(() {
              widget.task.priority = value!;
            });
          },
        ),
      ],
    );
  }
}
