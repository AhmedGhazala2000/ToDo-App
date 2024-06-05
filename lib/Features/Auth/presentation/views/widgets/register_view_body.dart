import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Features/Auth/data/models/register_request_model.dart';
import 'package:todo_app/Features/Auth/presentation/views/widgets/register_button_bloc_consumer.dart';

import '../../../../../Core/widgets/custom_text_form_field.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import 'select_country.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<RegisterViewBody> {
  bool isVisibility = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  String? name, phone, password, address, experienceLevel;
  num? experienceYears;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: ListView(
        children: [
          SizedBox(
              height: height * .25,
              child: Image.asset(
                'assets/images/art_image.png',
                fit: BoxFit.scaleDown,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Register', style: AppStyles.styleBold24),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  hintText: 'Name...',
                  keyboardType: TextInputType.name,
                  onSaved: (data) {
                    name = data;
                  },
                ),
                const SizedBox(
                  height: 15,
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
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'Years of experience...',
                  keyboardType: TextInputType.number,
                  onSaved: (data) {
                    experienceYears = num.parse(data!);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  readOnly: true,
                  hintText: 'Choose experience Level:',
                  keyboardType: TextInputType.none,
                  isExperienceLevel: true,
                  suffix: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CustomDropDownButton(
                      onChanged: (value) {
                        setState(() {
                          experienceLevel = value;
                        });
                      },
                      value: experienceLevel,
                      items: const ['Fresh', 'Junior', 'MidLevel', 'Senior'],
                      icon: const Icon(
                        FontAwesomeIcons.angleDown,
                        color: kFourthColor,
                        size: 22,
                      ),
                    ),
                  ),
                  experienceLevel: experienceLevel,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'Address...',
                  keyboardType: TextInputType.streetAddress,
                  onSaved: (data) {
                    address = data;
                  },
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
                  onSaved: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                RegisterButtonBlocConsumer(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var model = RegisterRequestModel(
                        phone: phone!,
                        password: password!,
                        displayName: name!,
                        experienceYears: experienceYears!,
                        address: address!,
                        level: experienceLevel!.toLowerCase(),
                      );
                      await BlocProvider.of<AuthCubit>(context)
                          .registerUser(model);
                    } else {
                      showSnackBar(context,
                          message: 'Please enter the required fields',
                          color: Colors.red);
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
                'Already have any account?',
                style: TextStyle(color: kFourthColor),
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
      ),
    );
  }
}
