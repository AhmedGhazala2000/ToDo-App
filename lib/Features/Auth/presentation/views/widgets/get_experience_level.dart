import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cubits/auth_cubit/auth_cubit.dart';

class GetExperienceLevel extends StatefulWidget {
  const GetExperienceLevel({super.key});

  @override
  State<GetExperienceLevel> createState() => _GetExperienceLevelState();
}

class _GetExperienceLevelState extends State<GetExperienceLevel> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: const EdgeInsets.only(right: 12),
      borderRadius: BorderRadius.circular(8),
      alignment: Alignment.center,
      underline: const SizedBox(),
      value: context.read<AuthCubit>().experienceLevel,
      onChanged: (String? newValue) {
        setState(() {
          context.read<AuthCubit>().experienceLevel = newValue!;
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
