import 'package:flutter/material.dart';
import 'package:todo_drift_app/navigation/main_navigator.dart';
import 'package:todo_drift_app/themes/main_theme.dart';

class MyApp extends StatelessWidget {
  static final mainNavigator = MainNavigator();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todo_drift_app',
      theme: MainTheme.theme,
      routes: mainNavigator.routes,
      onGenerateRoute: mainNavigator.onGenerateRoute,
    );
  }
}
