import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/local_network.dart';
import 'package:todo_app/Features/Splash/presentation/views/splash_view.dart';

import 'Core/utils/constant.dart';
import 'Core/utils/dependency_injection.dart';
import 'Core/utils/simple_bloc_observers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObservers();
  await CachedNetwork.init();
  setupDependencyInjection();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'DM Sans',
        datePickerTheme: DatePickerThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      routes: appRoutes(),
      initialRoute: SplashView.id,
    );
  }
}
