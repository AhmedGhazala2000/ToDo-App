import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/app_styles.dart';

class BuildCustomWidget extends StatelessWidget {
  const BuildCustomWidget(
      {super.key, required this.text, required this.widget});

  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppStyles.styleRegular12(context),
          ),
          const SizedBox(height: 8),
          widget,
        ],
      ),
    );
  }
}
