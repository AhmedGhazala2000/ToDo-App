import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/utils/app_images.dart';
import 'package:todo_app/Core/utils/app_styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/custom_list_tile.dart';

import '../utils/constant.dart';

class CustomPriorityListTile extends StatelessWidget {
  const CustomPriorityListTile(
      {super.key, required this.onChanged, required this.priority});

  final void Function(String?)? onChanged;
  final String priority;

  @override
  Widget build(BuildContext context) {
    final priorityColor = getPriorityColor(priority);
    return CustomListTile(
      title: Row(
        children: [
          SvgPicture.asset(
            Assets.flag,
            colorFilter: ColorFilter.mode(
              priorityColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '$priority Priority',
            style:
                AppStyles.styleBold16(context).copyWith(color: priorityColor),
          ),
        ],
      ),
      trailing: CustomDropDownButton(
        onChanged: onChanged,
        items: const ['Low', 'Medium', 'High'],
        icon: SvgPicture.asset(
          Assets.arrowDown,
          colorFilter: ColorFilter.mode(
            priorityColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
