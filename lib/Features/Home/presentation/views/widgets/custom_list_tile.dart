import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(top: 7, bottom: 7, left: 24, right: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kThirdColor,
      ),
      child: Center(
        child: ListTile(
          onTap: onTap,
          minVerticalPadding: 0,
          minTileHeight: 0,
          contentPadding: EdgeInsets.zero,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
        ),
      ),
    );
  }
}
