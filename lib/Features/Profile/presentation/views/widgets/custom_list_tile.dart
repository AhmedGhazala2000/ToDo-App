import 'package:flutter/material.dart';
import 'package:todo_app/Core/function/get_responsive_font_size.dart';
import 'package:todo_app/Core/utils/app_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.subtitle, this.trailing});

  final String title, subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        minTileHeight: 0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            title,
            style: AppStyles.styleMedium12(context).copyWith(
              color: const Color(0xff2F2F2F).withOpacity(.4),
            ),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 18),
            fontWeight: FontWeight.bold,
            color: const Color(0xff2F2F2F).withOpacity(.6),
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
