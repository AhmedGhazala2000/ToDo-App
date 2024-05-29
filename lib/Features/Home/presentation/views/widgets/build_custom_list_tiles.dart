import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'custom_list_tile.dart';

class BuildCustomListTiles extends StatefulWidget {
  const BuildCustomListTiles({super.key});

  @override
  State<BuildCustomListTiles> createState() => _BuildCustomListTilesState();
}

class _BuildCustomListTilesState extends State<BuildCustomListTiles> {
  DateTime? _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          onTap: _showDatePiker,
          title: const Text(
            'End Date',
            style: TextStyle(
              fontSize: 9,
              color: Color(0xff6E6A7C),
            ),
          ),
          subtitle: Text(
            DateFormat('d MMMM, yyyy').format(_selectedDate!),
            style: const TextStyle(color: kSecondColor),
          ),
          trailing: SvgPicture.asset('assets/images/calendar.svg'),
        ),
        const SizedBox(height: 8),
        CustomListTile(
          onTap: () {

          },
          title: Text(
            'Inprogress',
            style: AppStyles.styleBold16.copyWith(color: kPrimaryColor),
          ),
          trailing: SvgPicture.asset('assets/images/arrow-down.svg'),
        ),
        const SizedBox(height: 8),
        CustomListTile(
          onTap: () {},
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

  void _showDatePiker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then(
      (value) {
        if (value != null && value != _selectedDate) {
          setState(() {
            _selectedDate = value;
          });
        }
      },
    );
  }
}
