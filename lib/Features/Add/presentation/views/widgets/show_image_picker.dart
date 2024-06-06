import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../manager/add_task_cubit/add_task_cubit.dart';

void showImagePicker(BuildContext context) {
  final addTaskCubit = context.read<AddTaskCubit>();
  showModalBottomSheet(
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a photo'),
            onTap: () {
              _getImage(addTaskCubit, ImageSource.camera);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from gallery'),
            onTap: () {
              _getImage(addTaskCubit, ImageSource.gallery);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _getImage(AddTaskCubit addTaskCubit, ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);
  if (pickedFile != null) {
    addTaskCubit.image = pickedFile.path;
  }
}
