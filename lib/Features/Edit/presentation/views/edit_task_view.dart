import 'package:flutter/material.dart';
import 'package:todo_app/Core/function/build_custom_app_bar.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  static const String id = 'EditView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'Edit The Task'),
      ),
    );
  }
}
