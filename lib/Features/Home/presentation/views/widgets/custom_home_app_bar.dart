import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Text("Logo", style: AppStyles.styleBold24),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon:
            const Icon(Icons.account_circle_outlined, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
