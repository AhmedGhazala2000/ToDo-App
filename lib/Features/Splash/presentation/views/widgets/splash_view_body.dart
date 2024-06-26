import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/Core/utils/app_images.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/local_network.dart';
import 'package:todo_app/Features/Auth/presentation/views/login_view.dart';

import '../../../../Home/presentation/views/home_view.dart';
import '../../../../Onboarding/presentation/view/onboarding_view.dart';

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
          Assets.splash,
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
      () => Navigator.pushReplacementNamed(
        context,
        getNextPage(),
      ),
    );
  }

  getNextPage() {
    String token = CachedNetwork.sharedPref.getString(kAccessToken) ?? '';
    bool isFirstTime = CachedNetwork.sharedPref.getBool(kIsFirstTime) ?? true;
    if (token.isNotEmpty) {
      return HomeView.id;
    } else {
      if (isFirstTime) {
        return OnboardingView.id;
      }
      return LoginView.id;
    }
  }
}
