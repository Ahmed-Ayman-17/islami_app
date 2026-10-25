import 'package:flutter/material.dart';
import 'package:islami_app/ui/splash/ui_uties.dart';

class DefaultScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottomNavigationBar;

  const DefaultScreen({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    // سطر واحد بيعرفك إنت في أي وضع حالياً
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            // تغيير مسار الصورة بناءً على الثيم
            isDarkMode
                ? getFullPathImage(
                    "dark_bg.png",
                  ) // اسم صورة الخلفية الغامقة عندك
                : getFullPathImage("main_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            // أضفنا تغيير لون نص الـ AppBar بناءً على الثيم
            titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ],
    );
  }
}
