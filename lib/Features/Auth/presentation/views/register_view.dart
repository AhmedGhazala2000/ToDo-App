import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/service_locator.dart';
import 'package:todo_app/Features/Auth/data/repos/register_repo_impl.dart';

import '../manager/cubits/register_cubit/register_cubit.dart';
import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>()),
      child: const SafeArea(
        child: Scaffold(
          body: RegisterViewBody(),
        ),
      ),
    );
  }
}
