import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../cubits/upload_image_cubit/upload_image_cubit.dart';
import '../repos/upload_image_repo/upload_image_repo_impl.dart';
import '../utils/dependency_injection.dart';
import 'show_snack_bar.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => UploadImageCubit(getIt.get<UploadImageRepoImpl>()),
        child: Builder(
          builder: (context) {
            return BlocConsumer<UploadImageCubit, UploadImageState>(
              listener: (context, state) {
                if (state is UploadImageSuccessState) {
                  showSnackBar(
                    context,
                    message: 'Image added successfully',
                    color: Colors.green,
                  );
                } else if (state is UploadImageFailureState) {
                  showSnackBar(
                    context,
                    message: state.errMessage,
                    color: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                if (state is UploadImageLoadingState) {
                  return const SizedBox(
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.camera_alt),
                        title: const Text('Take a photo'),
                        onTap: () async {
                          await _pickImage(ImageSource.camera, context);
                          if (!context.mounted) return;
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('Choose from gallery'),
                        onTap: () async {
                          await _pickImage(ImageSource.gallery, context);
                          if (!context.mounted) return;
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                }
              },
            );
          },
        ),
      );
    },
  );
}

Future<void> _pickImage(ImageSource source, BuildContext context) async {
  final uploadImageCubit = context.read<UploadImageCubit>();
  final pickedFile =
      await ImagePicker().pickImage(source: source, imageQuality: 50);
  if (pickedFile != null) {
    final imgFile = File(pickedFile.path);
    await uploadImageCubit.uploadImage(imgFile: imgFile);
  }
}
