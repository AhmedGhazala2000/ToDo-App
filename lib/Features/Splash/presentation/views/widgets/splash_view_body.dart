import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../start_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    _navigateToNextPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/SplashIcon.svg',
        width: 124,
      ),
    );
  }

  Future<dynamic> _navigateToNextPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, StartView.id),
    );
  }
}
