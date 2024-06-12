import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowDatePiker extends StatelessWidget {
  const ShowDatePiker(
      {super.key, required this.onValue, required this.selectedDate});

  final Function(DateTime?) onValue;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDatePiker(context);
      },
      child: SvgPicture.asset(
        'assets/images/calendar.svg',
        fit: BoxFit.scaleDown,
      ),
    );
  }

  void _showDatePiker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then(onValue);
  }
}
