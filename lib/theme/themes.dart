import 'package:flutter/material.dart';

class MyThemeData {
  static final Color lightPrimary = Color(0XFFB7935F);

  static final ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0XFFB7935F),
      primary: Color(0XFFB7935F),
      onPrimary: Colors.white,
      secondary: Color(0XFFB7935F),
      onSecondary: Colors.black,
    ),
  );
}
