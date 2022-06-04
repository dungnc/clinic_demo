import 'package:flutter/material.dart';

class AppTheme {
  final lightTheme = ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.blue,
        onPrimary: Colors.blue,
        secondary: Colors.blue,
        onSecondary: Colors.blue,
        error: Colors.blue,
        onError: Colors.blue,
        background: Colors.blue,
        onBackground: Colors.blue,
        surface: Colors.blue,
        onSurface: Colors.blue,
        shadow: Colors.blue,
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)));

  final darkTheme = ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.white,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Colors.white,
        onSurface: Colors.white,
        shadow: Colors.white,
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)));
}
