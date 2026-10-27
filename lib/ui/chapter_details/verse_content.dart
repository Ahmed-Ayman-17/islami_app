import 'package:flutter/material.dart';
import 'package:islami_app/theme/themes.dart';

// ويدجت بتعرض آية واحدة: نص الآية متوسّط، وفي آخره دايرة صغيرة فيها رقمها
class VersrContent extends StatelessWidget {
  final String content;
  final int? number;

  const VersrContent({required this.content, this.number, super.key});

  String _toArabicDigits(int value) {
    const digits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return value.toString().split('').map((d) => digits[int.parse(d)]).join();
  }

  Widget _buildNumberBadge(int value, Color accentColor) {
    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: accentColor, width: 1.5),
      ),
      child: Text(
        _toArabicDigits(value),
        style: TextStyle(
          fontSize: 14,
          height: 1,
          fontWeight: FontWeight.bold,
          color: accentColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color accentColor =
        isDarkMode ? MyThemeData.darkAccent : MyThemeData.lightPrimary;
    Color textColor =
        isDarkMode ? MyThemeData.darkAccent : const Color(0xFF242424);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: content),
            if (number != null) ...[
              const WidgetSpan(child: SizedBox(width: 8)),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: _buildNumberBadge(number!, accentColor),
              ),
            ],
          ],
        ),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'AmiriQuran',
          fontSize: 26,
          height: 2.2,
          color: textColor,
        ),
      ),
    );
  }
}
