import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/get_responsive_font_size.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Core/widgets/custom_circular_indicator.dart';
import 'package:todo_app/Features/Home/presentation/views/home_view.dart';

import '../../manager/edit_task_cubit/edit_task_cubit.dart';

class EditTaskButtonBlocConsumer extends StatelessWidget {
  const EditTaskButtonBlocConsumer({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditTaskCubit, EditTaskState>(
      listener: (context, state) {
        if (state is EditTaskSuccessState) {
          showSnackBar(
            context,
            message: 'Task edited successfully',
            color: Colors.green,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeView.id,
            (route) => false,
          );
        } else if (state is EditTaskFailureState) {
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
          child: state is EditTaskLoadingState
              ? const CustomCircularIndicator()
              : Text(
                  'Save',
                  style: AppStyles.styleBold14(context).copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 19),
                  ),
                ),
        );
      },
    );
  }
}
