import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Core/widgets/custom_priority_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_status_list_tile.dart';
import 'package:todo_app/Core/widgets/custom_text_form_field.dart';
import 'package:todo_app/Core/widgets/show_image_picker.dart';
import 'package:todo_app/Features/Add/presentation/views/widgets/build_custom_widget.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';

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
            ShowImagePicker(
              text: 'Edit',
              onCameraTap: () => _getImage(ImageSource.camera),
              onGalleryTap: () => _getImage(ImageSource.gallery),
            ),
            BuildCustomWidget(
              text: 'Task title',
              widget: CustomTextFormField(
                hintText: task.title,
                keyboardType: TextInputType.text,
                onSubmitted: (data) {
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
                onSubmitted: (data) {
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
            CustomButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: AppStyles.styleBold14.copyWith(fontSize: 19),
              ),
            ),
            const SizedBox(height: 50),
          ],
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
