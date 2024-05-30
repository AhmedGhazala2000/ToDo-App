import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Profile/data/models/user_model.dart';
import 'package:todo_app/Features/Profile/data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitialState());
  final ProfileRepo _profileRepo;

  Future getProfile({required String token}) async {
    emit(ProfileLoadingState());
    final result = await _profileRepo.getProfile(token: token);
    result.fold(
      (failure) => emit(ProfileFailureState(failure.errMessage)),
      (success) => emit(ProfileSuccessState(success)),
    );
  }
}
