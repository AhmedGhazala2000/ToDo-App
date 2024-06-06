import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.isExperienceLevel = false,
    this.experienceLevel,
    this.isDueDate = false,
    this.onSaved,
  });

  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;
  final bool? isExperienceLevel;
  final bool? isDueDate;

  final String? experienceLevel;
  final int? maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (isExperienceLevel!) {
          if (experienceLevel == null) {
            return 'Please select your level';
          }
          return null;
        } else if (isDueDate!) {
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
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: isExperienceLevel! ? const Color(0xff2F2F2F) : kFourthColor,
          fontWeight: isExperienceLevel! ? FontWeight.w500 : FontWeight.normal,
        ),
        suffixIcon: suffix,
        suffixIconColor: kFifthColor,
        prefixIcon: prefix,
        prefixIconColor: kFourthColor,
        border: customOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: kFifthColor,
      ),
    );
  }
}
