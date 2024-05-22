import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';

import 'custom_text_form_field.dart';
import 'get_experience_level.dart';
import 'select_country.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<RegisterViewBody> {
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
                'Register',
                style: AppStyles.styleBold24.copyWith(
                  color: const Color(0xff24252C),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const CustomTextFormField(
                hintText: 'Name...',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                hintText: '123 456-7890',
                keyboardType: TextInputType.phone,
                prefix: SelectCountry(),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                hintText: 'Years of experience...',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                hintText: 'Choose experience Level:',
                keyboardType: TextInputType.none,
                isExperienceLevel: true,
                suffix: GetExperienceLevel(),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                hintText: 'Address...',
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(
                height: 15,
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
                  'Sign up',
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
              'Already have any account?',
              style: TextStyle(color: kSecondColor),
            ),
            CustomInputButton(
              child: Text(
                'Sign in',
                style: AppStyles.styleBold14.copyWith(color: kPrimaryColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
