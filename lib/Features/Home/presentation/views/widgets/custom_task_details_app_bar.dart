import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/presentation/manager/task_details_cubit/task_details_cubit.dart';

import '../home_view.dart';

class CustomTaskDetailsAppBar extends StatelessWidget {
  const CustomTaskDetailsAppBar({
    super.key,
    this.widget,
    this.onPressed,
  });

  final Widget? widget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset('assets/images/arrow_left.svg'),
                onPressed: () {
                  context.read<TaskDetailsCubit>().isEdited
                      ? Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeView.id,
                          (route) => false,
                        )
                      : Navigator.pop(context);
                },
              ),
              const SizedBox(width: 4),
              Text(
                'Task Details',
                style: AppStyles.styleBold16(context),
              ),
            ],
          ),
          widget ?? const SizedBox(),
        ],
      ),
    );
  }
}
