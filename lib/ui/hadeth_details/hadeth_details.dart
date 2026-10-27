import 'package:flutter/material.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/default_screen.dart';
import 'package:islami_app/ui/home/hadeth_tap/hadeth_tap.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DefaultScreen(
      title: AppLocalizations.of(context)?.app_title ?? "إسلامي",
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDarkMode
              ? MyThemeData.darkPrimary.withValues(alpha: 0.85)
              : Colors.white.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              args.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? MyThemeData.darkAccent : const Color(0xFF242424),
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              thickness: 1.5,
              height: 24,
              color: isDarkMode ? MyThemeData.darkAccent : MyThemeData.lightPrimary,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  args.content,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.7,
                    color: isDarkMode ? MyThemeData.darkAccent : const Color(0xFF242424),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
