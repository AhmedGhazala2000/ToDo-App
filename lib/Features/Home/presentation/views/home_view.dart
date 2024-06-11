import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/dependency_injection.dart';
import 'package:todo_app/Features/Add/presentation/views/add_task_view.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo/home_repo_impl.dart';
import 'package:todo_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/qr_view.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final RefreshController _controller = RefreshController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final status = ModalRoute.of(context)?.settings.arguments ?? 'All';

    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImpl>()),
      child: SafeArea(
        child: Scaffold(
          body: SmartRefresher(
            controller: _controller,
            onRefresh: () => _onRefresh(context, status.toString()),
            child: HomeViewBody(status: status.toString()),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 24, right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Scan Button
                FloatingActionButton.small(
                  heroTag: 'scan',
                  backgroundColor: kThirdColor,
                  shape: const CircleBorder(),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      QrView.id,
                    );
                  },
                  child: SvgPicture.asset('assets/images/barcode_icon.svg'),
                ),
                const SizedBox(height: 14),
                // Add Button
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

  // Refresh Function
  Future<void> _onRefresh(BuildContext context, String status) async {
    await Future.delayed(const Duration(seconds: 1)).then(
      (_) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeView.id,
          (route) => false,
          arguments: status,
        );
      },
    );
    _controller.refreshCompleted();
  }
}
