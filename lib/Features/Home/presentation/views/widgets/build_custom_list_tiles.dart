import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'custom_list_tile.dart';

class BuildCustomListTiles extends StatelessWidget {
  const BuildCustomListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          onTap: (){},
          title: const Text(
            'End Date',
            style: TextStyle(
              fontSize: 9,
              color: Color(0xff6E6A7C),
            ),
          ),
          subtitle: const Text(
            '30 June, 2022',
            style: TextStyle(color: kSecondColor),
          ),
          trailing: SvgPicture.asset('assets/images/calendar.svg'),
        ),
        const SizedBox(height: 8),
        CustomListTile(
          onTap: (){},
          title: Text(
            'Inprogress',
            style: AppStyles.styleBold16.copyWith(color: kPrimaryColor),
          ),
          trailing: SvgPicture.asset('assets/images/arrow-down.svg'),
        ),
        const SizedBox(height: 8),
        CustomListTile(
          onTap: (){},
          title: Row(
            children: [
              SvgPicture.asset('assets/images/flag.svg'),
              const SizedBox(width: 10),
              Text(
                'Medium Priority',
                style: AppStyles.styleBold16.copyWith(color: kPrimaryColor),
              ),
            ],
          ),
          trailing: SvgPicture.asset('assets/images/arrow-down.svg'),
        ),
      ],
    );
  }
}
