import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/Features/Add/data/repos/add_task_repo_impl.dart';
import 'package:todo_app/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:todo_app/Features/Profile/data/repos/profile_repo_impl.dart';

import 'api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt<ApiServices>(),
    ),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      getIt<ApiServices>(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt<ApiServices>(),
    ),
  );

  getIt.registerSingleton<AddTaskRepoImpl>(
    AddTaskRepoImpl(
      getIt<ApiServices>(),
    ),
  );
}
