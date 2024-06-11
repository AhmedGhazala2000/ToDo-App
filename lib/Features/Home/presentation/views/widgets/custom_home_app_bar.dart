import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/dependency_injection.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:todo_app/Features/Auth/presentation/views/login_view.dart';
import 'package:todo_app/Features/Profile/presentation/views/profile_view.dart';

import '../../../../../Core/widgets/custom_circular_indicator.dart';
import '../../../../Auth/presentation/manager/auth_cubit/auth_cubit.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const Text("Logo", style: AppStyles.styleBold24),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileView.id);
              },
              icon: const Icon(Icons.account_circle_outlined,
                  color: Colors.black),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LogoutSuccessState) {
                  showSnackBar(context,
                      message: 'Logout Success', color: Colors.green);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginView.id,
                    (route) => false,
                  );
                } else if (state is LogoutFailureState) {
                  showSnackBar(context, message: state.errMessage);
                }
              },
              builder: (context, state) {
                return IconButton(
                  icon: state is LogoutLoadingState
                      ? const CustomCircularIndicator(
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.logout,
                          color: kPrimaryColor,
                        ),
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logout();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
