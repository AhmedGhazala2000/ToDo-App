import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/Core/repos/upload_image_repo/upload_image_repo_impl.dart';
import 'package:todo_app/Features/Add/data/repos/add_task_repo_impl.dart';
import 'package:todo_app/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:todo_app/Features/Edit/data/repos/edit_task_repo_impl.dart';
import 'package:todo_app/Features/Home/data/repos/delete_task_repo/del_task_repo_impl.dart';
import 'package:todo_app/Features/Home/data/repos/home_repo/home_repo_impl.dart';
import 'package:todo_app/Features/Home/data/repos/task_details_repo/task_details_repo_impl.dart';
import 'package:todo_app/Features/Profile/data/repos/profile_repo_impl.dart';

import 'api_services.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  //Api Services Instance
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  final apiServices = getIt.get<ApiServices>();

  //Auth Repo Instance
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiServices));

  //Profile Repo Instance
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl(apiServices));

  //Home Repo Instance
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiServices));

  //Add Task Repo Instance
  getIt.registerSingleton<AddTaskRepoImpl>(AddTaskRepoImpl(apiServices));

  //Delete Task Repo Instance
  getIt.registerSingleton<DeleteTaskRepoImpl>(DeleteTaskRepoImpl(apiServices));

  //Edit Task Repo Instance
  getIt.registerSingleton<EditTaskRepoImpl>(EditTaskRepoImpl(apiServices));

  //Task Details Instance
  getIt
      .registerSingleton<TaskDetailsRepoImpl>(TaskDetailsRepoImpl(apiServices));

  //Upload Image Instance
  getIt
      .registerSingleton<UploadImageRepoImpl>(UploadImageRepoImpl(apiServices));
}
