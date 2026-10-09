import 'package:flutter/material.dart';
// متنساش تعمل Import للـ DefaultScreen
import 'package:islami_app/ui/default_screen.dart';

class ChapterDetails extends StatelessWidget {
  static const String routeName = 'chapter-details';
  const ChapterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // استقبال الـ args
    var args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs?;

    // استخدام الـ DefaultScreen
    return DefaultScreen(
      title: args?.chaptertitle ?? "إسلامي", // بنبعت اسم السورة للـ AppBar
      body: Container(
        // ده محتوى الشاشة (الـ body)
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85), // كارت أبيض شفاف شوية
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'سورة ${args?.chaptertitle ?? ""}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.play_circle_fill_rounded, size: 28),
              ],
            ),
            const Divider(thickness: 1.5, height: 24),
            const Expanded(
              child: Center(
                child: Text(
                  'سيتم عرض آيات السورة هنا',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterDetailsArgs {
  int chapterindex;
  String chaptertitle;
  ChapterDetailsArgs(this.chapterindex, this.chaptertitle);
}
