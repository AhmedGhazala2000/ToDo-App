import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/delete_task_cubit/delete_task_cubit.dart';

void showDeleteDialog(BuildContext context, String taskId) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.rightSlide,
    title: 'Deleting...',
    desc: 'Are you sure for delete this task ?',
    btnCancelOnPress: () {},
    btnCancelColor: Colors.green,
    btnOkOnPress: () async {
      await BlocProvider.of<DeleteTaskCubit>(context)
          .deleteTask(taskId: taskId);
    },
    btnOkColor: Colors.red,
  ).show();
}
