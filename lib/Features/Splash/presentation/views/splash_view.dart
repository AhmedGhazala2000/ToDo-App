import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SplashViewBody(),
      ),
    );
  }
}


