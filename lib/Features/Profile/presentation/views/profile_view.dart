import 'package:flutter/material.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/build_custom_app_bar.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const id = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'Profile'),
        body: const ProfileViewBody(),
      ),
    );
  }
}
