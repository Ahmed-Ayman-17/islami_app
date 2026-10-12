import 'package:flutter/material.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/chapter_details/chapter_details.dart';
import 'package:islami_app/ui/hadeth-details/hadeth-details.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetails.routeName: (_) => ChapterDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
      theme: MyThemeData.lightTheme,
    );
  }
}
