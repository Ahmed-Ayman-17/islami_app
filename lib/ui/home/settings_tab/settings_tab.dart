import 'package:flutter/material.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/settings/app_settings.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/home/settings_tab/language_bottom_sheet.dart';
import 'package:islami_app/ui/home/settings_tab/theme_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        AppSettings.themeModeNotifier,
        AppSettings.localeNotifier,
      ]),
      builder: (context, _) {
        bool isDarkMode = AppSettings.isDarkMode;
        bool isArabic = AppSettings.isArabic;
        var localizations = AppLocalizations.of(context)!;
        Color accentColor =
            isDarkMode ? MyThemeData.darkAccent : MyThemeData.lightPrimary;
        Color textColor = isDarkMode ? Colors.white : const Color(0xFF242424);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                localizations.theme,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const ThemeBottomSheet(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: accentColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isDarkMode ? localizations.dark : localizations.light,
                        style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: accentColor,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                localizations.language,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const LanguageBottomSheet(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: accentColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isArabic ? localizations.arabic : localizations.english,
                        style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: accentColor,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
