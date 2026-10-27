import 'package:flutter/material.dart';

class AppSettings {
  // ValueNotifier خاص بحالة الثيم (يبدأ بـ Light افتراضياً)
  static final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier(ThemeMode.light);

  // ValueNotifier خاص بحالة اللغة (يبدأ بالعربية افتراضياً)
  static final ValueNotifier<Locale> localeNotifier =
      ValueNotifier(const Locale('ar'));

  static bool get isDarkMode => themeModeNotifier.value == ThemeMode.dark;
  static bool get isArabic => localeNotifier.value.languageCode == 'ar';

  static void changeTheme(ThemeMode newMode) {
    themeModeNotifier.value = newMode;
  }

  static void changeLanguage(String languageCode) {
    localeNotifier.value = Locale(languageCode);
  }
}
