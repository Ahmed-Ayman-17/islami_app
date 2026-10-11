import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/chapter_details/verse_content.dart';
import 'package:islami_app/ui/default_screen.dart';

class ChapterDetails extends StatefulWidget {
  static const String routeName = 'chapter-details';
  const ChapterDetails({super.key});

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  // الآيات بعد التقسيم: كل عنصر فيه نص الآية ورقمها
  List<VerseItem> verses = [];
  bool isLoading = true; // مؤشر لتحميل الملف مرة واحدة بس

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // جلب البيانات مرة واحدة فقط عند فتح الشاشة
    var args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs?;
    if (args != null && isLoading) {
      isLoading = false;
      readFileData(args.chapterindex);
    }
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs?;

    return DefaultScreen(
      title: args?.chaptertitle ?? "إسلامي",
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(25),
        ),
        // لو الآيات لسه ما اتحملتش نعرض دايرة تحميل
        child: verses.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
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

                  // الخط تحت العنوان بقى بلون الثيم عشان يتناسق مع فواصل الآيات
                  Divider(
                    color: MyThemeData.lightPrimary,
                    thickness: 1.5,
                    height: 24,
                  ),

                  // قائمة الآيات: كل آية في سطر مستقل وبينها فاصل خفيف
                  Expanded(
                    child: ListView.separated(
                      itemCount: verses.length,
                      itemBuilder: (context, index) {
                        return VersrContent(
                          content: verses[index].text,
                          number: verses[index].number,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: MyThemeData.lightPrimary.withValues(
                            alpha: 0.35,
                          ),
                          thickness: 1,
                          height: 1,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // بنقرا ملف السورة وبنقسمه لآيات
  // try/catch عشان لو الملف مش موجود نعرض رسالة بدل دايرة تحميل للأبد
  // mounted عشان منعملش setState لو المستخدم خرج من الشاشة أثناء القراءة
  void readFileData(int fileIndex) async {
    try {
      final String fileContent = await rootBundle.loadString(
        "assets/files/${fileIndex + 1}.txt",
      );

      final List<VerseItem> parsed = _parseVerses(fileContent);

      if (!mounted) return;
      setState(() {
        verses = parsed;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        verses = [VerseItem('ملف هذه السورة غير متوفر بعد')];
      });
    }
  }

  // الدالة دي بتحوّل محتوى الملف لقائمة آيات
  // علامة نهاية الآية في ملفاتك هي رقم بين قوسين زي (12)
  List<VerseItem> _parseVerses(String fileContent) {
    final RegExp marker = RegExp(r'\((\d+)\)');

    // الحالة الأولى: الملف مفيهوش أرقام بين أقواس
    // يبقى كل سطر آية مستقلة، وبنرقمها بترتيبها
    if (!marker.hasMatch(fileContent)) {
      final List<String> lines = fileContent
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .toList();

      return [
        for (int i = 0; i < lines.length; i++) VerseItem(lines[i], i + 1),
      ];
    }

    // الحالة التانية: الأرقام جوه النص
    // بنحوّل الملف كله لنص واحد عشان لو آية مقسومة على أكتر من سطر
    final String fullText = fileContent.replaceAll(RegExp(r'\s+'), ' ').trim();

    final List<VerseItem> result = [];
    int start = 0;

    // كل رقم بنلاقيه بيقفل آية: النص اللي قبله هو الآية، والرقم هو ترتيبها
    for (final Match match in marker.allMatches(fullText)) {
      final String verseText = fullText.substring(start, match.start).trim();
      if (verseText.isNotEmpty) {
        result.add(VerseItem(verseText, int.parse(match.group(1)!)));
      }
      start = match.end;
    }

    // أي نص باقي بعد آخر رقم بنعرضه من غير دايرة رقم
    final String rest = fullText.substring(start).trim();
    if (rest.isNotEmpty) {
      result.add(VerseItem(rest));
    }

    return result;
  }
}

// نموذج بيانات بسيط للآية: نصها ورقمها
// الرقم اختياري عشان الرسائل اللي مش آيات (زي "الملف غير متوفر")
class VerseItem {
  final String text;
  final int? number;
  VerseItem(this.text, [this.number]);
}

class ChapterDetailsArgs {
  int chapterindex;
  String chaptertitle;
  ChapterDetailsArgs(this.chapterindex, this.chaptertitle);
}
