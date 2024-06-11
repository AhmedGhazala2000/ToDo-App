import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/local_network.dart';
import 'package:todo_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';

import 'custom_home_app_bar.dart';
import 'home_view_body_bloc_consumer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key, required this.status}) : super(key: key);

  final String status;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    _setCurrentSelectedIndexValue();
    _triggerHomeCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const CustomHomeAppBar(),
          Expanded(child: HomeViewBodyBlocConsumer(status: widget.status)),
        ],
      ),
    );
  }

  //set current selected index value
  void _setCurrentSelectedIndexValue() async {
    if (widget.status.toLowerCase() == 'all') {
      await CachedNetwork.sharedPref.setInt(kCurrentSelectedIndex, 0);
    }
  }

  //trigger home cubit
  Future<void> _triggerHomeCubit() async {
    await BlocProvider.of<HomeCubit>(context)
        .fetchAllTasks(status: widget.status);
  }
}
