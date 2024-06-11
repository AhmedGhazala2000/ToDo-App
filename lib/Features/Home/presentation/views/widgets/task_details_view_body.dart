import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/display_task_details.dart';

import '../../manager/task_details_cubit/task_details_cubit.dart';

class TaskDetailsViewBody extends StatefulWidget {
  const TaskDetailsViewBody({super.key, required this.taskId});

  final String taskId;

  @override
  State<TaskDetailsViewBody> createState() => _TaskDetailsViewBodyState();
}

class _TaskDetailsViewBodyState extends State<TaskDetailsViewBody> {
  @override
  void initState() {
    _triggerTaskDetailsCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      builder: (context, state) {
        if (state is TaskDetailsSuccessState) {
          return DisplayTaskDetails(task: state.task);
        } else if (state is TaskDetailsFailureState) {
          return Center(
            child: Text(state.errMessage, style: AppStyles.styleBold16),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> _triggerTaskDetailsCubit() async {
    await BlocProvider.of<TaskDetailsCubit>(context)
        .getTask(taskId: widget.taskId);
  }
}
