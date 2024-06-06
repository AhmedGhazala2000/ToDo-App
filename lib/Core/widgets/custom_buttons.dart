import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.isLoading = false});

  final void Function()? onPressed;
  final Widget? child;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      color: kPrimaryColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class CustomInputButton extends StatelessWidget {
  const CustomInputButton(
      {super.key, required this.onPressed, required this.child});

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.onChanged,
    required this.items,
    this.icon,
    this.value,
  });

  final void Function(String?)? onChanged;
  final List<String> items;
  final Widget? icon;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: kThirdColor,
      borderRadius: BorderRadius.circular(12),
      underline: const SizedBox(),
      value: value,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: icon,
    );
  }
}
