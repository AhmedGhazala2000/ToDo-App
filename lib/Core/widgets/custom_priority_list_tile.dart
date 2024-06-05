import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/function/get_priority_color.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/custom_list_tile.dart';

class CustomPriorityListTile extends StatefulWidget {
  CustomPriorityListTile({super.key, required this.priority});

  String priority;

  @override
  State<CustomPriorityListTile> createState() => _CustomPriorityListTileState();
}

class _CustomPriorityListTileState extends State<CustomPriorityListTile> {
  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/images/flag.svg',
            colorFilter: ColorFilter.mode(
              getPriorityColor(widget.priority),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${widget.priority} Priority',
            style: AppStyles.styleBold16
                .copyWith(color: getPriorityColor(widget.priority)),
          ),
        ],
      ),
      trailing: CustomDropDownButton(
        onChanged: (value) {
          setState(() {
            widget.priority = value!;
          });
        },
        items: const ['Low', 'Medium', 'High'],
        icon: SvgPicture.asset('assets/images/arrow-down.svg'),
      ),
    );
  }
}
