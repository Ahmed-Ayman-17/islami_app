import 'package:flutter/material.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/chapter_details/chapter_details.dart'; // تأكد إن مسار الثيم صح عشان نستخدم اللون

class ChapterTitle extends StatelessWidget {
  final String title;
  final String versesCount;
  final int index;

  // خلينا الـ Constructor ياخد اسم السورة وعدد الآيات
  const ChapterTitle({
    required this.title,
    required this.versesCount,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ChapterDetails.routeName,
          arguments: ChapterDetailsArgs(index, title),
        );
      },
      child: Row(
        children: [
          // عدد الآيات (على الشمال)
          Expanded(
            child: Text(
              versesCount,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          // الخط العمودي الفاصل
          Container(width: 2, color: MyThemeData.lightPrimary),
          // اسم السورة (على اليمين)
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
