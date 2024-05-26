import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Core/utils/service_locator.dart';
import 'Core/utils/simple_bloc_observers.dart';
import 'Features/Auth/presentation/views/login_view.dart';
import 'Features/Auth/presentation/views/register_view.dart';
import 'Features/Splash/presentation/views/splash_view.dart';
import 'Features/Splash/presentation/views/start_view.dart';

void main() {
  Bloc.observer = SimpleBlocObservers();
  setupServiceLocator();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DM Sans',
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        SplashView.id: (context) => const SplashView(),
        StartView.id: (context) => const StartView(),
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
      },
      initialRoute: SplashView.id,
    );
  }
}
