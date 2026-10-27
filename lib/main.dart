import 'package:flutter/material.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/settings/app_settings.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/chapter_details/chapter_details.dart';
import 'package:islami_app/ui/hadeth_details/hadeth_details.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          locale: AppSettings.localeNotifier.value,
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
