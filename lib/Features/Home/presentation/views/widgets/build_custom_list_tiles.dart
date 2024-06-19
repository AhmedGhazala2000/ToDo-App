import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/dependency_injection.dart';
import 'package:todo_app/Core/widgets/custom_priority_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_status_list_tile.dart';
import 'package:todo_app/Features/Edit/data/models/edit_task_model.dart';
import 'package:todo_app/Features/Edit/data/repos/edit_task_repo_impl.dart';
import 'package:todo_app/Features/Edit/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/presentation/manager/task_details_cubit/task_details_cubit.dart';

import 'custom_list_tile.dart';

class BuildCustomListTiles extends StatefulWidget {
  const BuildCustomListTiles({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  State<BuildCustomListTiles> createState() => _BuildCustomListTilesState();
}

class _BuildCustomListTilesState extends State<BuildCustomListTiles> {
  late String _priority;
  late String _status;

  @override
  void initState() {
    super.initState();
    _priority = widget.task.priority!;
    _status = widget.task.status!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTaskCubit(getIt.get<EditTaskRepoImpl>()),
      child: Builder(builder: (context) {
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
              trailing: SvgPicture.asset(
                'assets/images/calendar.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(height: 8),
            CustomStatusListTile(
              status: _status,
              onChanged: (value) {
                if (value != _status) {
                  _editModel(context, newStatus: value);
                  setState(() {
                    _status = value!;
                  });
                }
              },
            ),
            const SizedBox(height: 8),
            CustomPriorityListTile(
              priority: _priority,
              onChanged: (value) {
                if (value != _priority) {
                  _editModel(context, newPriority: value);
                  setState(() {
                    _priority = value!;
                  });
                }
              },
            ),
          ],
        );
      }),
    );
  }

  void _editModel(BuildContext context,
      {String? newPriority, String? newStatus}) {
    final EditTaskModel newModel = EditTaskModel(
      image: widget.task.image!,
      title: widget.task.title!,
      desc: widget.task.desc!,
      priority: newPriority ?? widget.task.priority!,
      status: newStatus ?? widget.task.status!,
      userId: widget.task.userId!,
    );
    context.read<EditTaskCubit>().editTask(
          editTaskModel: newModel,
          taskId: widget.task.taskId!,
        );
    context.read<TaskDetailsCubit>().isEdited = true;
  }
}
