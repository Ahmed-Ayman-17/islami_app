import 'package:flutter/material.dart';
import 'package:islami_app/ui/default_screen.dart';
import 'package:islami_app/ui/home/hadeth_tap/hadeth_tap.dart';

// شاشة تفاصيل الحديث الفردي
class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // استقبال كائن الحديث المُرسل عبر الـ Arguments من القائمة الرئيسية
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return DefaultScreen(
      title:
          "Islami", // اسم التطبيق الموحد في الـ AppBar بالاعتماد على الشاشة الثابتة
      body: Container(
        // تصميم الكارت الأبيض الشفاف الذي يحيط بنص الحديث
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            // عنوان الحديث في أعلى الكارت
            Text(
              args.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Divider(thickness: 1.5, height: 24, color: Colors.brown),

            // محتوى الحديث داخل Expanded مع Scroll لتفادي الـ Overflow لو كان النص طويلاً
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  args.content, // عرض نص الحديث الكامل هنا
                  textDirection:
                      TextDirection.rtl, // ضبط اتجاه النص من اليمين لليسار
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    height:
                        1.7, // المسافة بين السطور لسهولة ومراعاة راحة العين في القراءة
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
