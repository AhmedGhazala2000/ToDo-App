import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Features/Auth/data/models/login_request_model.dart';
import 'package:todo_app/Features/Auth/presentation/views/register_view.dart';

import '../../manager/cubits/auth_cubit/auth_cubit.dart';
import 'custom_text_form_field.dart';
import 'select_country.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isVisibility = true;
  String selectedCountry = '+20';
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  String? phone, password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/ArtImage.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: AppStyles.styleBold24.copyWith(
                    color: const Color(0xff24252C),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  hintText: '123 456-7890',
                  keyboardType: TextInputType.phone,
                  prefix: const SelectCountry(),
                  onSaved: (data) {
                    phone =
                        '${context.read<AuthCubit>().selectedCountry} $data';
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Password...',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isVisibility,
                  suffix: IconButton(
                    icon: Icon(
                      isVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        isVisibility = !isVisibility;
                      });
                    },
                  ),
                  onSaved: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      showSnackBar(context, message: 'Login Success, Welcome');
                    }
                    else if (state is LoginFailureState) {
                      showSnackBar(context, message: state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      child: state is LoginLoadingState
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            )
                          : Text(
                              'Sign In',
                              style: AppStyles.styleBold24.copyWith(
                                fontSize: 16,
                              ),
                            ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          var model = LoginRequestModel(
                            phone: phone!,
                            password: password!,
                          );
                          await BlocProvider.of<AuthCubit>(context)
                              .loginUser(model);
                        } else {
                          showSnackBar(context,
                              message: 'Please enter the required fields');
                          autoValidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Didn’t have any account?',
                style: TextStyle(color: kSecondColor),
              ),
              CustomInputButton(
                child: Text(
                  'Sign Up here',
                  style: AppStyles.styleBold14.copyWith(color: kPrimaryColor),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterView(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
