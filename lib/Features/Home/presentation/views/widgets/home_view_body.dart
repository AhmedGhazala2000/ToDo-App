import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';

import 'custom_home_app_bar.dart';
import 'home_view_body_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    _triggerHomeCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          CustomHomeAppBar(),
          Expanded(child: HomeViewBodyBlocBuilder()),
        ],
      ),
    );
  }

  void _triggerHomeCubit() async {
    await BlocProvider.of<HomeCubit>(context).fetchAllTasks();
  }
}
