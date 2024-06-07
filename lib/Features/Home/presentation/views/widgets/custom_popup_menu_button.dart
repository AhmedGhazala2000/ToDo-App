import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/service_locator.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:todo_app/Features/Home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/delete_task_bloc_listener.dart';

import 'custom_indented_divider.dart';
import 'show_delete_dialog.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key, required this.taskId});

  final String taskId;
  final EdgeInsets? customPadding =
      const EdgeInsets.symmetric(vertical: 12, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteTaskCubit(getIt.get<HomeRepoImpl>()),
      child: DeleteTaskBlocListener(
        child: PopupMenuButton<String>(
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.more_vert, color: Colors.black),
          itemBuilder: (context) => [
            //Edit Task
            PopupMenuItem<String>(
              padding: customPadding,
              onTap: () {},
              child: Text(
                'Edit',
                style: AppStyles.styleMedium12.copyWith(
                  fontSize: 16,
                  color: const Color(0xff00060D),
                ),
              ),
            ),
            const CustomIndentedDivider(),
            //Delete Task
            PopupMenuItem<String>(
              padding: customPadding,
              onTap: () {
                showDeleteDialog(context, taskId);
              },
              child: Text(
                'Delete',
                style: AppStyles.styleMedium12.copyWith(
                  fontSize: 16,
                  color: const Color(0xffFF7D53),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
