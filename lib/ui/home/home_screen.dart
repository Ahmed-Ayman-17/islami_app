import 'package:flutter/material.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/ui/default_screen.dart';
import 'package:islami_app/ui/home/bottom_nav_items.dart';
import 'package:islami_app/ui/home/hadeth_tap/hadeth_tap.dart';
import 'package:islami_app/ui/home/quran_tap/quran_tap.dart';
import 'package:islami_app/ui/home/radio_tap/radio_tap.dart';
import 'package:islami_app/ui/home/settings_tab/settings_tab.dart';
import 'package:islami_app/ui/home/tasbeh_tap/tasbeh_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    QuranTab(),
    const HadethTab(),
    const TasbehTab(),
    const RadioTap(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context)!;

    return DefaultScreen(
      title: localizations.app_title,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavItems(
            localizations.quran,
            'quran.png',
          ),
          BottomNavItems(
            localizations.hadeth,
            'quran-quran-svgrepo-com.png',
          ),
          BottomNavItems(
            localizations.tasbeh,
            'sebha.png',
          ),
          BottomNavItems(
            localizations.radio,
            'radio.png',
          ),
          BottomNavItems(
            localizations.settings,
            null,
            iconData: Icons.settings,
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
