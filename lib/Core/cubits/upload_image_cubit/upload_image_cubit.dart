import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/upload_image_repo/upload_image_repo.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._uploadImageRepo) : super(UploadImageInitialState());
  final UploadImageRepo _uploadImageRepo;

  Future uploadImage({required File imgFile}) async {
    emit(UploadImageLoadingState());
    final result = await _uploadImageRepo.uploadImage(imgFile: imgFile);
    result.fold(
      (failure) => emit(UploadImageFailureState(failure.errMessage)),
      (success) => emit(UploadImageSuccessState(success)),
    );
  }
}
