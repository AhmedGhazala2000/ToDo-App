import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/widgets/custom_priority_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_text_form_field.dart';
import 'package:todo_app/Core/widgets/show_date_piker.dart';

import '../../../../../Core/models/task_request_model.dart';
import '../../manager/add_task_cubit/add_task_cubit.dart';
import 'add_image_widget.dart';
import 'add_task_button_bloc_consumer.dart';
import 'build_custom_widget.dart';
import 'show_image_picker.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  String? title, desc;
  String priority = 'Medium';
  DateTime? dueDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              const SizedBox(height: 24),
              AddImageWidget(
                onTap: () {
                  showImagePicker(context);
                },
              ),
              BuildCustomWidget(
                text: 'Task title',
                widget: CustomTextFormField(
                  hintText: 'Enter title here...',
                  keyboardType: TextInputType.text,
                  onSaved: (data) {
                    title = data;
                  },
                ),
              ),
              BuildCustomWidget(
                text: 'Task Description',
                widget: CustomTextFormField(
                  hintText: 'Enter description here...',
                  keyboardType: TextInputType.text,
                  maxLines: 7,
                  onSaved: (data) {
                    desc = data;
                  },
                ),
              ),
              BuildCustomWidget(
                text: 'Priority',
                widget: CustomPriorityListTile(
                  priority: priority,
                  onChanged: (value) {
                    setState(() {
                      priority = value!;
                    });
                  },
                ),
              ),
              BuildCustomWidget(
                text: 'Due date',
                widget: CustomTextFormField(
                  hintText: 'choose due date...',
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  isDueDate: true,
                  suffix: ShowDatePiker(
                    selectedDate: dueDate ?? DateTime.now(),
                    onValue: (value) {
                      if (value != null && value != dueDate) {
                        setState(() {
                          dueDate = value;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              AddTaskButtonBlocConsumer(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    TaskRequestModel model = TaskRequestModel(
                      image: context.read<AddTaskCubit>().image,
                      title: title!,
                      desc: desc!,
                      priority: priority.toLowerCase(),
                      dueDate: dueDate?.toIso8601String(),
                    );
                    BlocProvider.of<AddTaskCubit>(context)
                        .addTask(addTaskModel: model);
                  } else {
                    showSnackBar(
                      context,
                      message: 'Please enter the required fields',
                      color: Colors.red,
                    );
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
