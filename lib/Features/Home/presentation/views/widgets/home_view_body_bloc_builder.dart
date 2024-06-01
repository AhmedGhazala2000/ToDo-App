import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/presentation/manager/cubits/home_cubit.dart';

import 'my_tasks_section.dart';

class HomeViewBodyBlocBuilder extends StatelessWidget {
  const HomeViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return const MyTasksSection();
        } else if (state is HomeFailureState) {
          return Center(
            child: Text(state.errMessage, style: AppStyles.styleBold16),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
