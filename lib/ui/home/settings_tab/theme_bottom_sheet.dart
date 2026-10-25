import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/settings_tab/settings_tab.dart'; // تأكد من المسار الصحيح لملف الإعدادات

// نافذة من الأسفل (Bottom Sheet) لاختيار الثيم (فاتیح أو داكن)
class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // التحقق مما إذا كان الثيم الحالي هو الداكن أم الفاتح
    bool isDarkMode = AppSettings.themeModeNotifier.value == ThemeMode.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF141A2E) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // خيار الوضع الفاتح (Light Mode)
          InkWell(
            onTap: () {
              // تغيير الثيم إلى Light وإغلاق الشيت فوراً
              AppSettings.themeModeNotifier.value = ThemeMode.light;
              Navigator.pop(context);
            },
            child: AppSettings.themeModeNotifier.value == ThemeMode.light
                ? getSelectedItemWidget("Light", isDarkMode)
                : getUnselectedItemWidget("Light", isDarkMode),
          ),
          const SizedBox(height: 20),

          // خيار الوضع الداكن (Dark Mode)
          InkWell(
            onTap: () {
              // تغيير الثيم إلى Dark وإغلاق الشيت فوراً
              AppSettings.themeModeNotifier.value = ThemeMode.dark;
              Navigator.pop(context);
            },
            child: AppSettings.themeModeNotifier.value == ThemeMode.dark
                ? getSelectedItemWidget("Dark", isDarkMode)
                : getUnselectedItemWidget("Dark", isDarkMode),
          ),
        ],
      ),
    );
  }

  // دالة لتصميم العنصر المختار (يظهر تحته علامة صح ولونه مميز)
  Widget getSelectedItemWidget(String text, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFB7935F), // اللون الذهبي المميز للتحديد
          ),
        ),
        const Icon(Icons.check, color: Color(0xFFB7935F), size: 25),
      ],
    );
  }

  // دالة لتصميم العنصر غير المختار
  Widget getUnselectedItemWidget(String text, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}

// كلاس عام لإدارة حالة الثيم واللغة باستخدام ValueNotifier بدون Provider
class AppSettings {
  // ValueNotifier خاص بحالة الثيم (يبدأ بـ Light افتراضياً)
  static final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(
    ThemeMode.light,
  );

  // ValueNotifier خاص بحالة اللغة (سيتم استخدامه في التاسك القادم)
  static final ValueNotifier<Locale> localeNotifier = ValueNotifier(
    const Locale('ar'),
  );
}
