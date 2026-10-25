import 'dart:math'; // لاستخدام الدوال الرياضية وحساب زاوية الدوران بالراديان
import 'package:flutter/material.dart';

// تاب السبحة المسؤول عن عرض السبحة التفاعلية والعداد والأذكار
class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  // متغير لحفظ عدد التسبيحات الحالي ويبدأ من صفر
  int counter = 0;

  // قائمة الأذكار التي يتم التبديل بينها بالترتيب المطلوب
  final List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  // مؤشر الذكر الحالي داخل القائمة (يبدأ بـ 0 يعني 'سبحان الله')
  int currentIndex = 0;

  // زاوية دوران خرز السبحة وتزداد تدريجياً مع كل ضغطة
  double rotationAngle = 0.0;

  // دالة مسؤولة عن تحديث العداد، وزاوية الدوران، والذكر الحالي عند كل ضغطة
  void incrementCounter() {
    setState(() {
      // زيادة العداد بواحدة عند الضغط
      counter++;

      // حساب زاوية الدوران لكل ضغطة (360 درجة مقسومة على 33 تسبيحة ومحولة إلى الراديان)
      rotationAngle += (2 * pi) / 33;

      // إذا وصل العداد إلى 33، يتم إعادة تصفيره والتبديل للذكر التالي في القائمة
      if (counter == 33) {
        counter = 0;
        currentIndex = (currentIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // جلب مقاسات الشاشة لضبط الأبعاد بشكل متجاوب وجميل
    var mediaQuery = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // جزء تصميم السبحة (الراس ثابت في مكانه والدايرة تتحرك تحتها) باستخدام Stack
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // صورة رأس السبحة (تظل ثابتة ولا تتأثر بالدوران)
              Container(
                margin: EdgeInsets.only(left: mediaQuery.width * 0.1),
                child: Image.asset(
                  'assets/images/head of seb7a.png', // ملف صورة رأس السبحة
                  height: 80,
                ),
              ),
              // صورة خرز السبحة الدائرية مع تطبيق تأثير الدوران بنعومة عند الضغط
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: GestureDetector(
                  onTap: incrementCounter, // الضغط على السبحة نفسها يزيد العداد
                  child: Transform.rotate(
                    angle: rotationAngle, // تطبيق زاوية الدوران المحسوبة
                    child: Image.asset(
                      'assets/images/body of seb7a.png', // ملف صورة جسم السبحة الدائري
                      height: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // نص عنوان عدد التسبيحات الثابت
          const Text(
            'عدد التسبيحات',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // الحاوية التي تعرض رقم العد الحالي بشكل مميز
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            decoration: BoxDecoration(
              color: const Color(
                0xFFB7935F,
              ).withOpacity(0.57), // خلفية لونها متناسق مع الثيم
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              '$counter', // عرض الرقم المتغير
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 25),

          // زر الذكر الحالي الذي عند الضغط عليه يتفاعل أيضاً ويقوم بالتسبيح
          ElevatedButton(
            onPressed: incrementCounter, // ربط زر الذكر بنفس دالة العد
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB7935F), // اللون الأساسي للزر
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              azkar[currentIndex], // عرض نص الذكر الحالي بناءً على المؤشر
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
