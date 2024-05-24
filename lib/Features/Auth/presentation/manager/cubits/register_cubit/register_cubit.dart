import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Auth/data/models/register_request_model.dart';
import 'package:todo_app/Features/Auth/data/repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitialState());
final RegisterRepo registerRepo;
Future registerUser(RegisterRequestModel model) async {
  emit(RegisterLoadingState());

  final result = await registerRepo.register(model);
  result.fold(
    (failure) => emit(RegisterFailureState(failure.errMessage)),
    (success) => emit(RegisterSuccessState()),
  );

  }
}
