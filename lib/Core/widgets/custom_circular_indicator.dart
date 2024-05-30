import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(color: color ?? Colors.white),
    );
  }
}
