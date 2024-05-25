import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Auth/data/models/register_request_model.dart';
import 'package:todo_app/Features/Auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._registerRepo) : super(AuthInitialState());
  final AuthRepo _registerRepo;
  String? selectedCountry = '+20';
  String? experienceLevel;


  Future registerUser(RegisterRequestModel model) async {
    emit(RegisterLoadingState());

    final result = await _registerRepo.register(model);
    result.fold(
      (failure) => emit(RegisterFailureState(failure.errMessage)),
      (success) => emit(RegisterSuccessState()),
    );
  }
}
