import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/service_locator.dart';
import 'package:todo_app/Features/Add/presentation/views/add_task_view.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:todo_app/Features/Home/presentation/manager/cubits/home_cubit.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImpl>()),
      child: SafeArea(
        child: Scaffold(
          body: const HomeViewBody(),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 24, right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  backgroundColor: kThirdColor,
                  shape: const CircleBorder(),
                  onPressed: () {},
                  child: SvgPicture.asset('assets/images/barcode_icon.svg'),
                ),
                const SizedBox(height: 14),
                FloatingActionButton(
                  heroTag: 'add',
                  backgroundColor: kPrimaryColor,
                  shape: const CircleBorder(),
                  onPressed: () {
                    Navigator.pushNamed(context, AddTaskView.id);
                  },
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
