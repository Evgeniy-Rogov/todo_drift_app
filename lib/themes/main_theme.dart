import 'package:flutter/material.dart';

class MainTheme {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[400],
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(0, 0, 0, 0.7),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
