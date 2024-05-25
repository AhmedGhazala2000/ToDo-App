import 'package:flutter/material.dart';

class GetExperienceLevel extends StatefulWidget {
  const GetExperienceLevel({super.key});

  @override
  State<GetExperienceLevel> createState() => _GetExperienceLevelState();
}

class _GetExperienceLevelState extends State<GetExperienceLevel> {
  String? experienceLevel;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: const EdgeInsets.only(right: 12),
      borderRadius: BorderRadius.circular(8),
      alignment: Alignment.center,
      underline: const SizedBox(),
      value: experienceLevel,
      onChanged: (String? newValue) {
        setState(() {
          experienceLevel = newValue!;
        });
      },
      items: <String>['fresh', 'junior', 'midLevel', 'senior']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
