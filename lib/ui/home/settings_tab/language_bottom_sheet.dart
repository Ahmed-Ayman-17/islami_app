import 'package:flutter/material.dart';
// استورد ملف AppSettings من مكانه الصحيح عندك
import 'package:islami_app/ui/home/settings_tab/theme_bottom_sheet.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // التحقق من اللغة الحالية
    bool isArabic = AppSettings.localeNotifier.value.languageCode == 'ar';

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
          // خيار اللغة العربية
          InkWell(
            onTap: () {
              AppSettings.localeNotifier.value = const Locale('ar');
              Navigator.pop(context);
            },
            child: isArabic
                ? getSelectedItemWidget("العربية", isDarkMode)
                : getUnselectedItemWidget("العربية", isDarkMode),
          ),
          const SizedBox(height: 20),

          // خيار اللغة الإنجليزية
          InkWell(
            onTap: () {
              AppSettings.localeNotifier.value = const Locale('en');
              Navigator.pop(context);
            },
            child: !isArabic
                ? getSelectedItemWidget("English", isDarkMode)
                : getUnselectedItemWidget("English", isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB7935F),
          ),
        ),
        const Icon(Icons.check, color: Color(0xFFB7935F), size: 25),
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
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
