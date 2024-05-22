import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.obscureText = false,
    this.isExperienceLevel = false,
  });

  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? isExperienceLevel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: isExperienceLevel! ? const Color(0xff2F2F2F) : kSecondColor,
          fontWeight: isExperienceLevel! ? FontWeight.w500 : FontWeight.normal,
        ),
        suffixIcon: suffix,
        suffixIconColor: kThirdColor,
        prefixIcon: prefix,
        prefixIconColor: kSecondColor,
        border: customOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: kThirdColor,
      ),
    );
  }
}
