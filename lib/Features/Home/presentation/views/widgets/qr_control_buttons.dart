import 'package:flutter/material.dart';
import 'package:todo_app/Core/function/get_responsive_font_size.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/app_styles.dart';

class QrControlButtons extends StatelessWidget {
  const QrControlButtons(
      {super.key,
      required this.onPausePressed,
      required this.onFlipPressed,
      required this.onFlashPressed,
      required this.isFlashOn,
      required this.isCameraFront,
      required this.isCameraPaused});

  final VoidCallback onPausePressed, onFlipPressed, onFlashPressed;
  final bool isFlashOn, isCameraFront, isCameraPaused;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildControlButton(
          context,
          icon: isFlashOn ? Icons.flash_off : Icons.flash_on,
          isIconColor: isFlashOn,
          label: 'Flash',
          onPressed: onFlashPressed,
        ),
        _buildControlButton(
          context,
          icon: Icons.flip_camera_android,
          isIconColor: isCameraFront,
          label: 'Flip',
          onPressed: onFlipPressed,
        ),
        _buildControlButton(
          context,
          icon: isCameraPaused ? Icons.play_arrow : Icons.pause,
          isIconColor: !isCameraPaused,
          label: isCameraPaused ? 'Resume' : 'Pause',
          onPressed: onPausePressed,
        ),
      ],
    );
  }

  Widget _buildControlButton(BuildContext context,
      {required IconData icon,
      bool isIconColor = false,
      required String label,
      required VoidCallback onPressed}) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: getResponsiveFontSize(context, fontSize: 30),
            color: isIconColor ? kPrimaryColor : null,
          ),
          onPressed: onPressed,
        ),
        Text(
          label,
          style: AppStyles.styleRegular12(context),
        ),
      ],
    );
  }
}
