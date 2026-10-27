import 'package:flutter/material.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/chapter_details/chapter_details.dart';

class ChapterTitle extends StatelessWidget {
  final String title;
  final String versesCount;
  final int index;

  const ChapterTitle({
    required this.title,
    required this.versesCount,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color dividerColor =
        isDarkMode ? MyThemeData.darkAccent : MyThemeData.lightPrimary;
    Color textColor = isDarkMode ? Colors.white : const Color(0xFF242424);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ChapterDetails.routeName,
          arguments: ChapterDetailsArgs(index, title),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                versesCount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                ),
              ),
            ),
            Container(width: 2, height: 35, color: dividerColor),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
