import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size ?? 23.h,
        width: size ?? 23.w,
        child: CircularProgressIndicator(
          color: color ?? Colors.white,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
