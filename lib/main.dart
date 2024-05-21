import 'package:flutter/material.dart';

import 'Features/Splash/presentation/views/splash_view.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'DM Sans',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
