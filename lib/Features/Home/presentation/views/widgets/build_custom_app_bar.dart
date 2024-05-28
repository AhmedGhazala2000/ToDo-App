import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/Core/utils/styles.dart';

AppBar buildCustomAppBar(BuildContext context,{required String title, Widget? actions}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon:  SvgPicture.asset('assets/images/ArrowLeft.svg'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    titleSpacing: 0,
    title: Text(
      title,
      style: AppStyles.styleBold16,
    ),
    actions: actions == null ? null : [actions],
  );
}
