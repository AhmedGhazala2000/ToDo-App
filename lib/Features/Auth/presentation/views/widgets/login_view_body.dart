import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/Core/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onPressed: () {},
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
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
