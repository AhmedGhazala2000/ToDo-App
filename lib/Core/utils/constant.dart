import 'package:flutter/material.dart';
import 'package:todo_app/Features/Profile/presentation/views/profile_view.dart';

import '../../Features/Add/presentation/views/add_task_view.dart';
import '../../Features/Auth/presentation/views/login_view.dart';
import '../../Features/Auth/presentation/views/register_view.dart';
import '../../Features/Home/presentation/views/home_view.dart';
import '../../Features/Home/presentation/views/task_details_view.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/Splash/presentation/views/start_view.dart';

const Color kPrimaryColor = Color(0xff5F33E1);
const Color kSecondColor = Color(0xff24252C);
const Color kThirdColor = Color(0xffF0ECFF);
const Color kFourthColor = Color(0xff7F7F7F);
const Color kFifthColor = Color(0xffBABABA);
const String kIsFirstTime = 'isFirstTime';
const String kAccessToken = 'accessToken';
const String kRefreshToken = 'refreshToken';

abstract class EndPoints {
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';
  static const String refreshToken = 'auth/refresh-token';
  static const String profile = 'auth/profile';
  static const String todos = 'todos';
}

Map<String, WidgetBuilder> appRoutes() {
  return {
    SplashView.id: (context) => const SplashView(),
    StartView.id: (context) => const StartView(),
    LoginView.id: (context) => const LoginView(),
    RegisterView.id: (context) => const RegisterView(),
    HomeView.id: (context) => const HomeView(),
    ProfileView.id: (context) => const ProfileView(),
    TaskDetailsView.id: (context) => const TaskDetailsView(),
    AddTaskView.id: (context) => const AddTaskView(),
  };
}
