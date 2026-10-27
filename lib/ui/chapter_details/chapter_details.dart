import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/l10n/app_localizations.dart';
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
  List<VerseItem> verses = [];
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color accentColor =
        isDarkMode ? MyThemeData.darkAccent : MyThemeData.lightPrimary;
    Color headerColor =
        isDarkMode ? MyThemeData.darkAccent : const Color(0xFF242424);

    return DefaultScreen(
      title: AppLocalizations.of(context)?.app_title ?? "إسلامي",
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          color: isDarkMode
              ? MyThemeData.darkPrimary.withValues(alpha: 0.85)
              : Colors.white.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(25),
        ),
        child: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: accentColor,
                ),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'سورة ${args?.chaptertitle ?? ""}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: headerColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.play_circle_fill_rounded,
                        size: 28,
                        color: headerColor,
                      ),
                    ],
                  ),
                  Divider(
                    color: accentColor,
                    thickness: 1.5,
                    height: 24,
                  ),
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
                          color: accentColor.withValues(alpha: 0.35),
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

  List<VerseItem> _parseVerses(String fileContent) {
    final RegExp marker = RegExp(r'\((\d+)\)');

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

    final String fullText = fileContent.replaceAll(RegExp(r'\s+'), ' ').trim();

    final List<VerseItem> result = [];
    int start = 0;

    for (final Match match in marker.allMatches(fullText)) {
      final String verseText = fullText.substring(start, match.start).trim();
      if (verseText.isNotEmpty) {
        result.add(VerseItem(verseText, int.parse(match.group(1)!)));
      }
      start = match.end;
    }

    final String rest = fullText.substring(start).trim();
    if (rest.isNotEmpty) {
      result.add(VerseItem(rest));
    }

    return result;
  }
}

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
