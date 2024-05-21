import 'package:flutter/material.dart';

import 'widgets/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: StartViewBody(),
      ),
    );
  }
}
