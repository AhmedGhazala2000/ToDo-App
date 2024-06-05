import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowDatePiker extends StatefulWidget {
  ShowDatePiker({super.key, required this.selectedDate});

  DateTime selectedDate;

  @override
  State<ShowDatePiker> createState() => _ShowDatePikerState();
}

class _ShowDatePikerState extends State<ShowDatePiker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showDatePiker,
      child: SvgPicture.asset(
        'assets/images/calendar.svg',
        fit: BoxFit.scaleDown,
      ),
    );
  }

  void _showDatePiker() {
    showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then(
      (value) {
        if (value != null && value != widget.selectedDate) {
          setState(() {
            widget.selectedDate = value;
          });
        }
      },
    );
  }
}
