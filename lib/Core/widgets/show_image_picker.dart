import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';

class ShowImagePicker extends StatelessWidget {
  const ShowImagePicker(
      {super.key, required this.text, this.onCameraTap, this.onGalleryTap});

  final String text;

  final void Function()? onCameraTap, onGalleryTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showCustomBottomSheet(context),
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

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: onCameraTap,
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: onGalleryTap,
            ),
          ],
        );
      },
    );
  }
}
