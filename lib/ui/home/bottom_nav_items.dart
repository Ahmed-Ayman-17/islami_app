import 'package:flutter/material.dart';
import 'package:islami_app/ui/splash/ui_uties.dart';

class BottomNavItems extends BottomNavigationBarItem {
  BottomNavItems(
    String title,
    String? iconPath, {
    IconData? iconData,
  }) : super(
          icon: iconPath != null && iconPath != 'settings.png'
              ? ImageIcon(AssetImage(getFullPathImage(iconPath)))
              : Icon(iconData ?? Icons.settings),
          label: title,
        );
}

// كلاس بنفس الاسم والترتيب القديم عشان لو تم استدعاؤه بـ positional arguments
class BottonNavItems extends BottomNavItems {
  BottonNavItems(
    super.title,
    super.iconPath, {
    super.iconData,
  });
}
