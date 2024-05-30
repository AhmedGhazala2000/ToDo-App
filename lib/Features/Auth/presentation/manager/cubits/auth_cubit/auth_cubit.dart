import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Auth/data/models/auth_response_model.dart';
import 'package:todo_app/Features/Auth/data/models/login_request_model.dart';
import 'package:todo_app/Features/Auth/data/models/register_request_model.dart';
import 'package:todo_app/Features/Auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitialState());
  final AuthRepo _authRepo;
  String? selectedCountry = '+20';
  AuthResponseModel? authResponseModel;

  // register cubit
  Future registerUser(RegisterRequestModel model) async {
    emit(RegisterLoadingState());

    final result = await _authRepo.register(model);
    result.fold(
      (failure) => emit(RegisterFailureState(failure.errMessage)),
      (success) {
        emit(RegisterSuccessState());
        authResponseModel = success;
      },
    );
  }

  // login cubit
  Future loginUser(LoginRequestModel model) async {
    emit(LoginLoadingState());

    final result = await _authRepo.login(model);
    result.fold(
      (failure) => emit(LoginFailureState(failure.errMessage)),
      (success) {
        emit(LoginSuccessState(success));
        authResponseModel = success;
      },
    );
  }

  // logout cubit
  Future logout() async {
    emit(LogoutLoadingState());
    final result =
        await _authRepo.logout(token: authResponseModel!.accessToken);
    result.fold(
      (failure) => emit(LogoutFailureState(failure.errMessage)),
      (success) => emit(LogoutSuccessState()),
    );
  }
}
