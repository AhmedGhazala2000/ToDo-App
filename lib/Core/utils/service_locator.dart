import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/Features/Auth/data/repos/register_repo_impl.dart';

import 'api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<RegisterRepoImpl>(
    RegisterRepoImpl(
      getIt<ApiServices>(),
    ),
  );
}
