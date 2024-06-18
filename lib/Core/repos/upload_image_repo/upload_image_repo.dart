import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';

abstract class UploadImageRepo {
  Future<Either<Failures, String>> uploadImage({required File imgFile});
}
