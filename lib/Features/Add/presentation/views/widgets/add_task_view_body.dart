import 'package:flutter/material.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Core/widgets/custom_priority_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_text_form_field.dart';
import 'package:todo_app/Core/widgets/show_date_piker.dart';
import 'package:todo_app/Features/Add/presentation/views/widgets/build_custom_widget.dart';

import 'add_image_widget.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;

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
              const AddImageWidget(),
              BuildCustomWidget(
                text: 'Task title',
                widget: CustomTextFormField(
                  hintText: 'Enter title here...',
                  keyboardType: TextInputType.text,
                  onSaved: (data) {},
                ),
              ),
              BuildCustomWidget(
                text: 'Task Description',
                widget: CustomTextFormField(
                  hintText: 'Enter description here...',
                  keyboardType: TextInputType.text,
                  maxLines: 7,
                  onSaved: (data) {},
                ),
              ),
              BuildCustomWidget(
                text: 'Priority',
                widget: CustomPriorityListTile(priority: 'Medium'),
              ),
              BuildCustomWidget(
                text: 'Due date',
                widget: CustomTextFormField(
                  hintText: 'choose due date...',
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  suffix: ShowDatePiker(selectedDate: DateTime.now()),
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  } else {
                    showSnackBar(context,
                        message: 'Please enter the required fields',
                        color: Colors.red);
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: Text(
                  'Add task',
                  style: AppStyles.styleBold14.copyWith(fontSize: 19),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
