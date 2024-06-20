import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/custom_list_tile.dart';

import '../utils/constant.dart';

class CustomStatusListTile extends StatelessWidget {
  const CustomStatusListTile(
      {super.key, required this.onChanged, required this.status});

  final void Function(String?)? onChanged;
  final String status;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: Text(
        status,
        style: AppStyles.styleBold16(context).copyWith(
          color: getStatusTextColor(status),
        ),
      ),
      trailing: CustomDropDownButton(
        onChanged: onChanged,
        items: const ['Waiting', 'Inprogress', 'Finished'],
        icon: SvgPicture.asset(
          'assets/images/arrow-down.svg',
          colorFilter: ColorFilter.mode(
            getStatusTextColor(status),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
