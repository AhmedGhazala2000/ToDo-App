import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/constant.dart';
import '../../manager/cubits/auth_cubit/auth_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.obscureText = false,
    this.isExperienceLevel = false,
    this.onSaved,
    this.readOnly = false,
  });

  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? isExperienceLevel;
  final bool? readOnly;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (isExperienceLevel!) {
          if (context.read<AuthCubit>().experienceLevel == null) {
            return 'Please select your level';
          }
          return null;
        } else if (text!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      readOnly: readOnly!,
      onSaved: onSaved,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: isExperienceLevel! ? const Color(0xff2F2F2F) : kThirdColor,
          fontWeight: isExperienceLevel! ? FontWeight.w500 : FontWeight.normal,
        ),
        suffixIcon: suffix,
        suffixIconColor: kFourthColor,
        prefixIcon: prefix,
        prefixIconColor: kThirdColor,
        border: customOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: kFourthColor,
      ),
    );
  }
}
