import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/widgets/custom_priority_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_text_form_field.dart';
import 'package:todo_app/Core/widgets/show_date_piker.dart';
import 'package:todo_app/Features/Add/data/models/add_task_model.dart';

import '../../../../../Core/widgets/show_image_picker.dart';
import '../../manager/add_task_cubit/add_task_cubit.dart';
import 'add_task_button_bloc_consumer.dart';
import 'build_custom_widget.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  String? image, title, desc;
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
              ShowImagePicker(
                text: 'Add',
                onCameraTap: () {
                  _getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                onGalleryTap: () {
                  _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              BuildCustomWidget(
                text: 'Task title',
                widget: CustomTextFormField(
                  hintText: 'Enter title here...',
                  keyboardType: TextInputType.text,
                  onSaved: (data) {
                    title = data;
                    setState(() {});
                  },
                ),
              ),
              BuildCustomWidget(
                text: 'Task Description',
                widget: CustomTextFormField(
                  hintText: 'Enter description here...',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
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
                  hintText: dueDate == null
                      ? 'choose due date...'
                      : DateFormat('d/M/yyyy').format(dueDate!),
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
                    AddTaskModel model = AddTaskModel(
                      image: image ?? '',
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

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      image = pickedFile.path;
    }
  }
}
