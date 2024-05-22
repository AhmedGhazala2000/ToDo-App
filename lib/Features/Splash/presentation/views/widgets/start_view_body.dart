import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Features/Auth/presentation/views/login_view.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/ArtImage.png')),
        const SizedBox(height: 24),
        Text(
          'Task Management &\nTo-Do List',
          textAlign: TextAlign.center,
          style: AppStyles.styleBold24.copyWith(
            color: const Color(0xff24252C),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff6E6A7C)),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Let’s Start',
                  style: AppStyles.styleBold24
                      .copyWith(fontSize: 19, color: Colors.white),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset('assets/images/arrow-right.svg'),
              ],
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
