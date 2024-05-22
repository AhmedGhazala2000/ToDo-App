import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.obscureText = false,
  });

  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kSecondColor),
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
