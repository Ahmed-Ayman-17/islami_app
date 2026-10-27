import 'package:flutter/material.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/settings/app_settings.dart';
import 'package:islami_app/theme/themes.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppSettings.isDarkMode;
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
              AppSettings.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: !isDarkMode
                ? getSelectedItemWidget(localizations.light, accentColor)
                : getUnselectedItemWidget(localizations.light, isDarkMode),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              AppSettings.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: isDarkMode
                ? getSelectedItemWidget(localizations.dark, accentColor)
                : getUnselectedItemWidget(localizations.dark, isDarkMode),
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
