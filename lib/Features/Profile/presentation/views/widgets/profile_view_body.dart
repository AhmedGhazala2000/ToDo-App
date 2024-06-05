import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Profile/presentation/manager/profile_cubit/profile_cubit.dart';

import 'display_profile_data.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    _triggerProfileCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccessState) {
          return DisplayProfileData(user: state.userModel);
        } else if (state is ProfileFailureState) {
          return Center(
            child: Text(state.errMessage, style: AppStyles.styleBold16),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> _triggerProfileCubit() async {
    await BlocProvider.of<ProfileCubit>(context).getProfile();
  }
}
