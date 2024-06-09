import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/Features/Add/data/repos/add_task_repo_impl.dart';
import 'package:todo_app/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:todo_app/Features/Edit/data/repos/edit_task_repo_impl.dart';
import 'package:todo_app/Features/Home/data/repos/delete_task_repo/del_task_repo_impl.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo/home_repo_impl.dart';
import 'package:todo_app/Features/Profile/data/repos/profile_repo_impl.dart';

import 'api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //Api Services Instance
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );

  //Auth Repo Instance
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt<ApiServices>(),
    ),
  );

  //Profile Repo Instance
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      getIt<ApiServices>(),
    ),
  );

  //Home Repo Instance
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt<ApiServices>(),
    ),
  );

  //Add Task Repo Instance
  getIt.registerSingleton<AddTaskRepoImpl>(
    AddTaskRepoImpl(
      getIt<ApiServices>(),
    ),
  );

  //Delete Task Repo Instance
  getIt.registerSingleton<DeleteTaskRepoImpl>(
    DeleteTaskRepoImpl(
      getIt<ApiServices>(),
    ),
  );

  //Edit Task Repo Instance
  getIt.registerSingleton<EditTaskRepoImpl>(
    EditTaskRepoImpl(
      getIt<ApiServices>(),
    ),
  );
}
