import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Features/Home/data/models/task_model.dart';
import 'package:todo_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';

import 'my_tasks_section.dart';

class HomeViewBodyBlocBuilder extends StatefulWidget {
  const HomeViewBodyBlocBuilder({super.key});

  @override
  State<HomeViewBodyBlocBuilder> createState() =>
      _HomeViewBodyBlocBuilderState();
}

class _HomeViewBodyBlocBuilderState extends State<HomeViewBodyBlocBuilder> {
  late final ScrollController _scrollController;
  bool isLoading = false;
  List<TaskModel> todos = [];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccessState) {
          todos.addAll(state.tasks);
        } else if (state is HomeFailurePaginationState) {
          showSnackBar(context, message: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        if (state is HomeSuccessState ||
            state is HomeLoadingPaginationState ||
            state is HomeFailurePaginationState) {
          return MyTasksSection(
            controller: _scrollController,
            todos: todos,
          );
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

  void _scrollListener() async {
    final currentPosition = _scrollController.position.pixels;
    final maxScrollLength = _scrollController.position.maxScrollExtent;
    final isNearEnd = currentPosition >= .75 * maxScrollLength;
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    if (isNearEnd && !isLoading && homeCubit.hasMoreTasks) {
      isLoading = true;
      await BlocProvider.of<HomeCubit>(context).fetchAllTasks();
      isLoading = false;
    }
  }
}
