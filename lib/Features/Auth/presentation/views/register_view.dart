import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/service_locator.dart';
import '../../data/repos/auth_repo_impl.dart';
import '../manager/cubits/auth_cubit/auth_cubit.dart';
import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String id = "RegisterView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<RegisterRepoImpl>()),
      child: const SafeArea(
        child: Scaffold(
          body: RegisterViewBody(),
        ),
      ),
    );
  }
}
