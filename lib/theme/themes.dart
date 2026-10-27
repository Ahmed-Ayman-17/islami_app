import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color darkAccent = Color(0xFFFACC1D);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    dividerColor: lightPrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF242424),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF242424),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      selectedItemColor: Color(0xFF242424),
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 26),
    ),
    colorScheme: const ColorScheme.light(
      primary: lightPrimary,
      onPrimary: Colors.white,
      secondary: lightPrimary,
      onSecondary: Color(0xFF242424),
      surface: Colors.white,
      onSurface: Color(0xFF242424),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    dividerColor: darkAccent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkPrimary,
      selectedItemColor: darkAccent,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 26),
    ),
    colorScheme: const ColorScheme.dark(
      primary: darkPrimary,
      onPrimary: Colors.white,
      secondary: darkAccent,
      onSecondary: Colors.white,
      surface: darkPrimary,
      onSurface: darkAccent,
    ),
  );
}
