import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';

import '../../manager/cubits/auth_cubit/auth_cubit.dart';

class RegisterButtonBlocConsumer extends StatelessWidget {
  const RegisterButtonBlocConsumer({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showSnackBar(context,
              message: 'Successfully registered, Login now',
              color: Colors.green);
          Navigator.pop(context);
          context.read<AuthCubit>().experienceLevel = null;
        } else if (state is RegisterFailureState) {
          showSnackBar(context, message: state.errMessage,color: Colors.red);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: onPressed,
          child: state is RegisterLoadingState
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : const Text(
                  'Sign up',
                  style: AppStyles.styleBold16
                ),
        );
      },
    );
  }
}
