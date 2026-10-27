import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/theme/themes.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  final List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int currentIndex = 0;
  double rotationAngle = 0.0;

  void incrementCounter() {
    setState(() {
      counter++;
      rotationAngle += (2 * pi) / 33;
      if (counter == 33) {
        counter = 0;
        currentIndex = (currentIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var localizations = AppLocalizations.of(context)!;

    Color? sebhaColor = isDarkMode ? MyThemeData.darkAccent : null;
    Color titleColor = isDarkMode ? Colors.white : const Color(0xFF242424);
    Color counterBoxColor = isDarkMode
        ? MyThemeData.darkPrimary.withValues(alpha: 0.85)
        : MyThemeData.lightPrimary.withValues(alpha: 0.57);
    Color counterTextColor =
        isDarkMode ? Colors.white : const Color(0xFF242424);
    Color buttonBgColor =
        isDarkMode ? MyThemeData.darkAccent : MyThemeData.lightPrimary;
    Color buttonTextColor =
        isDarkMode ? MyThemeData.darkPrimary : Colors.white;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(left: mediaQuery.width * 0.1),
                child: Image.asset(
                  'assets/images/head of seb7a.png',
                  height: 80,
                  color: sebhaColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: GestureDetector(
                  onTap: incrementCounter,
                  child: Transform.rotate(
                    angle: rotationAngle,
                    child: Image.asset(
                      'assets/images/body of seb7a.png',
                      height: 200,
                      color: sebhaColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            localizations.number_of_praises,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            decoration: BoxDecoration(
              color: counterBoxColor,
              borderRadius: BorderRadius.circular(25),
              border: isDarkMode
                  ? Border.all(color: MyThemeData.darkAccent.withValues(alpha: 0.4))
                  : null,
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: counterTextColor,
              ),
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: incrementCounter,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonBgColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              azkar[currentIndex],
              style: TextStyle(
                fontSize: 22,
                color: buttonTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
