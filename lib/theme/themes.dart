import 'package:flutter/material.dart';

class MyThemeData {
  static final Color lightPrimary = Color(0XFFB7935F);
  // ملاحظة سريعة: يفضل تسميها darkPrimary بدل dartPrimary عشان تكون منطقية أكتر
  static final Color darkPrimary = Color(0XFF141A2E);

  static final ThemeData lightTheme = ThemeData(
    // 1. تعريف إن ده الثيم الفاتح
    brightness: Brightness.light,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: const Color.fromARGB(255, 233, 230, 230),
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
      brightness: Brightness.light, // تأكيد للفاتح
      primary: Color(0XFFB7935F),
      onPrimary: Colors.white,
      secondary: Color(0XFFB7935F),
      onSecondary: Colors.black,
    ),
  );

  // إضافة الثيم الداكن هنا
  static final ThemeData darkTheme = ThemeData(
    // 2. السطر السحري اللي هيشغل لك الـ Dark Mode ويغير الخلفية للكحلي
    brightness: Brightness.dark,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(
        0XFFFACC1D,
      ), // اللون الذهبي للعنصر المختار في الداكن
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
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0XFF141A2E),
      brightness: Brightness.dark, // تأكيد للداكن
      primary: Color(0XFF141A2E),
      onPrimary: Colors.white,
      secondary: Color(0XFF141A2E),
      onSecondary: Colors.white,
    ),
  );
}
