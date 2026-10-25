import 'package:flutter/material.dart';
import 'package:islami_app/theme/themes.dart';

// ويدجت بتعرض آية واحدة: نص الآية متوسّط، وفي آخره دايرة صغيرة فيها رقمها
// الرقم اختياري (nullable)، لو null مش بنرسم الدايرة،
// ودي حالة رسالة زي "الملف غير متوفر" اللي مش آية فعلية
class VersrContent extends StatelessWidget {
  final String content;
  final int? number;

  const VersrContent({required this.content, this.number, super.key});

  // بيحوّل الرقم لأرقام عربية (12 تبقى ١٢) عشان تتناسب مع نص الآية
  String _toArabicDigits(int value) {
    const digits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return value.toString().split('').map((d) => digits[int.parse(d)]).join();
  }

  // دايرة رقم الآية: إطار بلون الثيم ورقم عربي بنفس اللون
  // اخترنا 34 عشان تكفي أرقام من 3 خانات زي سورة البقرة (٢٨٦)
  Widget _buildNumberBadge(int value) {
    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: MyThemeData.lightPrimary, width: 1.5),
      ),
      child: Text(
        _toArabicDigits(value),
        style: TextStyle(
          fontSize: 14,
          height: 1,
          fontWeight: FontWeight.bold,
          color: MyThemeData.lightPrimary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // مسافة رأسية مريحة فوق وتحت كل آية
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      // Text.rich بيخلينا نحط النص والدايرة في نفس السطر
      // WidgetSpan هو اللي بيسمح بوضع ويدجت عادية وسط النص
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: content),
            if (number != null) ...[
              const WidgetSpan(child: SizedBox(width: 8)),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: _buildNumberBadge(number!),
              ),
            ],
          ],
        ),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        // height: 2 مهم عشان التشكيل ما يتداخلش مع السطر اللي فوقه
        style: const TextStyle(
          fontFamily: 'AmiriQuran',
          fontSize: 26,
          height: 2.2,
          color: Colors.black87,
        ),
      ),
    );
  }
}
