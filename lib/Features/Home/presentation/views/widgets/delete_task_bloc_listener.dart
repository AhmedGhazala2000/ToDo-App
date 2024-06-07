import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';

import '../../manager/delete_task_cubit/delete_task_cubit.dart';
import '../home_view.dart';

class DeleteTaskBlocListener extends StatelessWidget {
  const DeleteTaskBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteTaskCubit, DeleteTaskState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccessState) {
          showSnackBar(context,
              message: 'Task deleted successfully', color: Colors.green);
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeView.id,
            (route) => false,
          );
        } else if (state is DeleteTaskFailureState) {
          showSnackBar(
            context,
            message: state.errMessage,
            color: Colors.red,
          );
        }
      },
      child: child,
    );
  }
}
