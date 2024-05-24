import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Features/Auth/presentation/views/register_view.dart';

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
                const CustomTextFormField(
                  hintText: '123 456-7890',
                  keyboardType: TextInputType.phone,
                  prefix: SelectCountry(),
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
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                  child: Text(
                    'Sign In',
                    style: AppStyles.styleBold24.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                    } else {
                      showSnackBar(context,
                          message: 'Please enter the required fields');
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
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
