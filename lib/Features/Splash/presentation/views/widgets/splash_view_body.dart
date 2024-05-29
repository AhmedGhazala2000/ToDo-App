import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../start_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _fadeAnimation();
    _navigateToNextPage();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation!,
      child: Center(
        child: SvgPicture.asset(
          'assets/images/splash_icon.svg',
          width: 124,
        ),
      ),
    );
  }

  void _fadeAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );

    _controller?.forward();
  }

  Future<dynamic> _navigateToNextPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, StartView.id),
    );
  }
}
