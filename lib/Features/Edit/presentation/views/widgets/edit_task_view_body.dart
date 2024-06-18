import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/widgets/add_image_widget.dart';
import 'package:todo_app/Core/widgets/build_custom_widget.dart';
import 'package:todo_app/Core/widgets/custom_priority_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_status_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_text_form_field.dart';
import 'package:todo_app/Features/Edit/data/models/edit_task_model.dart';
import 'package:todo_app/Features/Edit/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';

import 'edit_task_button_bloc_consumer.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({super.key});

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  String? image, title, desc, priority, status;

  @override
  Widget build(BuildContext context) {
    final TaskModel task =
        ModalRoute.of(context)?.settings.arguments as TaskModel;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const AddImageWidget(
              text: 'Edit',
            ),
            BuildCustomWidget(
              text: 'Task title',
              widget: CustomTextFormField(
                hintText: task.title,
                keyboardType: TextInputType.text,
                onChanged: (data) {
                  title = data;
                },
              ),
            ),
            BuildCustomWidget(
              text: 'Task Description',
              widget: CustomTextFormField(
                hintText: task.desc,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 7,
                onChanged: (data) {
                  desc = data;
                },
              ),
            ),
            BuildCustomWidget(
              text: 'Priority',
              widget: CustomPriorityListTile(
                priority: priority ?? task.priority!,
                onChanged: (value) {
                  setState(() {
                    priority = value!;
                  });
                },
              ),
            ),
            BuildCustomWidget(
              text: 'Status',
              widget: CustomStatusListTile(
                status: status ?? task.status!,
                onChanged: (value) {
                  setState(() {
                    status = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            EditTaskButtonBlocConsumer(
              onPressed: () {
                final EditTaskModel model = EditTaskModel(
                  title: title ?? task.title!,
                  desc: desc ?? task.desc!,
                  priority: priority?.toLowerCase() ?? task.priority!,
                  status: status?.toLowerCase() ?? task.status!,
                  image: image ?? task.image!.path,
                  userId: task.userId!,
                );
                BlocProvider.of<EditTaskCubit>(context).editTask(
                  editTaskModel: model,
                  taskId: task.taskId!,
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
