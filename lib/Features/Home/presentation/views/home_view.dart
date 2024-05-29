import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/utils/constant.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const HomeViewBody(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 24, right: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton.small(
                shape: const CircleBorder(),
                onPressed: () {},
                child: SvgPicture.asset('assets/images/barcode_icon.svg'),
              ),
              const SizedBox(height: 14),
              FloatingActionButton(
                heroTag: 'add',
                backgroundColor: kPrimaryColor,
                shape: const CircleBorder(),
                onPressed: () {},
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
