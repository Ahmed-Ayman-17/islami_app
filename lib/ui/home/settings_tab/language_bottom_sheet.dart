import 'package:flutter/material.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/settings/app_settings.dart';
import 'package:islami_app/theme/themes.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppSettings.isDarkMode;
    bool isArabic = AppSettings.isArabic;
    var localizations = AppLocalizations.of(context)!;
    Color accentColor =
        isDarkMode ? MyThemeData.darkAccent : MyThemeData.lightPrimary;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? MyThemeData.darkPrimary : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              AppSettings.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: isArabic
                ? getSelectedItemWidget(localizations.arabic, accentColor)
                : getUnselectedItemWidget(localizations.arabic, isDarkMode),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              AppSettings.changeLanguage('en');
              Navigator.pop(context);
            },
            child: !isArabic
                ? getSelectedItemWidget(localizations.english, accentColor)
                : getUnselectedItemWidget(localizations.english, isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text, Color accentColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: accentColor,
          ),
        ),
        Icon(Icons.check, color: accentColor, size: 25),
      ],
    );
  }

  Widget getUnselectedItemWidget(String text, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white : const Color(0xFF242424),
          ),
        ),
      ],
    );
  }
}
