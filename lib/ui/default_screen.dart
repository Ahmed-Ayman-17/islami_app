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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            isDarkMode
                ? getFullPathImage("dark-bg.png")
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
            titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : const Color(0xFF242424),
            ),
            iconTheme: IconThemeData(
              color: isDarkMode ? Colors.white : const Color(0xFF242424),
            ),
          ),
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ],
    );
  }
}
