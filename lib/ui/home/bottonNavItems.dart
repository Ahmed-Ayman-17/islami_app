import 'package:flutter/material.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/splash/ui_uties.dart';

class BottonNavItems extends BottomNavigationBarItem {
  BottonNavItems(String title, String IconPath)
    : super(
        icon: ImageIcon(AssetImage(getFullPathImage(IconPath))),
        label: title,
        backgroundColor: MyThemeData.lightPrimary,
      );
}
