import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/display_task_details.dart';

import '../../manager/task_details_cubit/task_details_cubit.dart';
import 'custom_task_details_app_bar.dart';

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
          return buildColumn(
            context,
            Text(
              state.errMessage,
              style: AppStyles.styleBold16(context),
            ),
          );
        } else {
          return buildColumn(
            context,
            const CircularProgressIndicator(),
          );
        }
      },
    );
  }

  //return unSuccess state (error message and circular indicator)
  Column buildColumn(BuildContext context, Widget child) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22),
          child: CustomTaskDetailsAppBar(),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .4),
        Center(
          child: child,
        ),
      ],
    );
  }

  Future<void> _triggerTaskDetailsCubit() async {
    await BlocProvider.of<TaskDetailsCubit>(context)
        .getTask(taskId: widget.taskId);
  }
}
