import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Core/utils/constant.dart';
import 'Core/utils/service_locator.dart';
import 'Core/utils/simple_bloc_observers.dart';
import 'Features/Home/presentation/views/home_view.dart';


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
      routes: appRoutes(),
      initialRoute: HomeView.id,
    );
  }

}
