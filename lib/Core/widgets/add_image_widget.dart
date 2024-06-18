import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';

import '../function/show_custom_bottom_sheet.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showCustomBottomSheet(context),
      child: DottedBorder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: const [2, 2],
        color: kPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/addImg_icon.svg'),
            const SizedBox(width: 8),
            Text(
              '$text Img',
              style: AppStyles.styleMedium12.copyWith(
                color: kPrimaryColor,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
