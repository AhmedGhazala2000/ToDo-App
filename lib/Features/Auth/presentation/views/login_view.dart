import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/service_locator.dart';

import '../../data/repos/auth_repo_impl.dart';
import '../manager/cubits/auth_cubit/auth_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String id = "LoginView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<RegisterRepoImpl>()),
      child: const SafeArea(
        child: Scaffold(
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
