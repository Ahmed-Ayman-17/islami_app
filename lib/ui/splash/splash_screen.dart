import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/splash/ui_uties.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        getFullPathImage("splash.jpg"),
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
