import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Core/widgets/custom_circular_indicator.dart';
import 'package:todo_app/Features/Add/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/Features/Home/presentation/views/home_view.dart';

class AddTaskButtonBlocConsumer extends StatelessWidget {
  const AddTaskButtonBlocConsumer({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccessState) {
          showSnackBar(
            context,
            message: 'Task added successfully',
            color: Colors.green,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeView.id,
            (route) => false,
          );
        } else if (state is AddTaskFailureState) {
          showSnackBar(
            context,
            message: state.errMessage,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: onPressed,
          child: state is AddTaskLoadingState
              ? const CustomCircularIndicator()
              : Text(
                  'Add Task',
                  style: AppStyles.styleBold14.copyWith(fontSize: 19),
                ),
        );
      },
    );
  }
}
