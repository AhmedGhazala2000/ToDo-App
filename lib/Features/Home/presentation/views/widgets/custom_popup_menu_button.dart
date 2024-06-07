import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/styles.dart';

import 'custom_indented_divider.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  final EdgeInsets? customPadding =
      const EdgeInsets.symmetric(vertical: 12, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.more_vert, color: Colors.black),
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          padding: customPadding,
          onTap: () {},
          child: Text(
            'Edit',
            style: AppStyles.styleMedium12.copyWith(
              fontSize: 16,
              color: const Color(0xff00060D),
            ),
          ),
        ),
        const CustomIndentedDivider(),
        PopupMenuItem<String>(
          padding: customPadding,
          onTap: () {},
          child: Text(
            'Delete',
            style: AppStyles.styleMedium12.copyWith(
              fontSize: 16,
              color: const Color(0xffFF7D53),
            ),
          ),
        ),
      ],
    );
  }
}
