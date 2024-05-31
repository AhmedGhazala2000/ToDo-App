import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23,
      width: 23,
      child: CircularProgressIndicator(
        color: color ?? Colors.white,
        strokeWidth: 3,
      ),
    );
  }
}
