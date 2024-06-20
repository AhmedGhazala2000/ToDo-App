import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/Core/utils/constant.dart';

class SelectTasksItem extends StatelessWidget {
  const SelectTasksItem(
      {super.key, required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      duration: const Duration(milliseconds: 500),
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isSelected ? kPrimaryColor : const Color(0xffF0ECFF),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : const Color(0xff7C7C80),
          ),
        ),
      ),
    );
  }
}
