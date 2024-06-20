import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';

import '../function/get_responsive_font_size.dart';

abstract class AppStyles {
  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      color: kSecondColor,
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: kSecondColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle styleMedium12(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      color: const Color(0xff6E6A7C),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }
}
