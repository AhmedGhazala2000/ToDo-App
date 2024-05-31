import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/service_locator.dart';
import 'package:todo_app/Core/function/build_custom_app_bar.dart';
import 'package:todo_app/Features/Profile/data/repos/profile_repo_impl.dart';
import '../manager/cubits/profile_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const id = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt.get<ProfileRepoImpl>()),
      child: SafeArea(
        child: Scaffold(
          appBar: buildCustomAppBar(context, title: 'Profile'),
          body: const ProfileViewBody(),
        ),
      ),
    );
  }
}
