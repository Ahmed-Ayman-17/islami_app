import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 👈 ضروري
import 'package:islami_app/l10n/app_localizations.dart';

// استيرادات شاشاتك
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/home/settings_tab/theme_bottom_sheet.dart';
import 'package:islami_app/ui/splash/splash_screen.dart';
import 'package:islami_app/ui/chapter_details/chapter_details.dart';
import 'package:islami_app/ui/hadeth-details/hadeth-details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // دمجنا المراقبة على الثيم واللغة في Listenable واحد
    return ListenableBuilder(
      listenable: Listenable.merge([
        AppSettings.themeModeNotifier,
        AppSettings.localeNotifier,
      ]),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Islami App',
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,

          themeMode: AppSettings.themeModeNotifier.value,
          locale: AppSettings.localeNotifier.value, // 👈 قراءة اللغة الحالية
          // 👈 إعدادات مكاتب الترجمة
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            ChapterDetails.routeName: (context) => const ChapterDetails(),
            HadethDetails.routeName: (context) => const HadethDetails(),
          },
        );
      },
    );
  }
}
