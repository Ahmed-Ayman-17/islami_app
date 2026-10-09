import 'package:flutter/material.dart';
import 'package:islami_app/ui/splash/ui_uties.dart';

class DefaultScreen extends StatelessWidget {
  final String title; // عنوان الشاشة
  final Widget body; // محتوى الشاشة اللي هيتغير
  final Widget? bottomNavigationBar; // اختياري عشان شاشة التفاصيل مفيهاش Navbar

  const DefaultScreen({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. الخلفية الثابتة في كل الشاشات
        Positioned.fill(
          child: Image.asset(
            getFullPathImage("main_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        // 2. الـ Scaffold الشفاف
        Scaffold(
          backgroundColor: Colors.transparent, // مهم جداً عشان الخلفية تبان
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: body, // المحتوى اللي هنبعته من بره هيتحط هنا
          bottomNavigationBar:
              bottomNavigationBar, // هيتحط لو مبعوت، لو مش مبعوت مش هيظهر
        ),
      ],
    );
  }
}
