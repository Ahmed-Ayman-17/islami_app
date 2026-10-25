import 'package:flutter/material.dart';
// تأكد من مسار استيراد DefaultScreen و نموذج Hadeth بناءً على ترتيب ملفاتك
import 'package:islami_app/ui/default_screen.dart';
import 'package:islami_app/ui/home/hadeth_tap/hadeth_tap.dart';

class HadethDetails extends StatelessWidget {
  // اسم الـ Route اللي بنستخدمه في الـ Navigator
  static const String routeName = "hadeth-details";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. استقبال البيانات (الحديث) المبعوتة من شاشة HadethTab
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    // 2. التحقق من الثيم الحالي (عشان نغير ألوان الكارت والنصوص)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DefaultScreen(
      title: 'إسلامي', // عنوان الـ AppBar الثابت
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          // لون خلفية الكارت: كحلي غامق في الداكن، وأبيض في الفاتح مع شوية شفافية
          color: isDarkMode
              ? const Color(0xFF141A2E).withOpacity(0.8)
              : Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // عرض عنوان الحديث (مثل: الحديث الأول)
            Text(
              args.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                // اللون أصفر في الداكن وأسود في الفاتح
                color: isDarkMode ? const Color(0xFFFACC1D) : Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            // خط فاصل بين العنوان والمحتوى
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 1,
              endIndent: 30,
              indent: 30,
            ),

            const SizedBox(height: 10),

            // عرض محتوى الحديث (استخدمنا Expanded و SingleChildScrollView عشان لو الحديث طويل يتعملوله Scroll)
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  args.content,
                  textAlign: TextAlign.right, // محاذاة النص لليمين عشان عربي
                  textDirection: TextDirection.rtl, // اتجاه القراءة
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.8, // مسافة بين السطور لسهولة القراءة
                    color: isDarkMode ? Colors.white : Colors.black,
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
