import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/l10n/app_localizations.dart';
import 'package:islami_app/theme/themes.dart';
import 'package:islami_app/ui/hadeth_details/hadeth_details.dart';
import 'package:islami_app/ui/splash/ui_uties.dart';

class Hadeth {
  String title;
  String content;
  Hadeth({required this.title, required this.content});
}

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> allHadeth = [];

  @override
  void initState() {
    super.initState();
    readHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color dividerColor =
        isDarkMode ? MyThemeData.darkAccent : MyThemeData.lightPrimary;
    Color textColor = isDarkMode ? Colors.white : const Color(0xFF242424);
    var localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Image.asset(
              getFullPathImage('hadith_header.png'),
              height: 130,
            ),
          ),
        ),
        Container(width: double.infinity, height: 2, color: dividerColor),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            localizations.hadeth,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(width: double.infinity, height: 2, color: dividerColor),
        Expanded(
          child: allHadeth.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: dividerColor,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          HadethDetails.routeName,
                          arguments: allHadeth[index],
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          allHadeth[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: textColor,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: dividerColor,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                  ),
                  itemCount: allHadeth.length,
                ),
        ),
      ],
    );
  }

  void readHadethFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/files/ahadeth.txt',
    );

    List<String> separatedAhadeth = fileContent.split("#");

    for (int i = 0; i < separatedAhadeth.length; i++) {
      String singleHadeth = separatedAhadeth[i];

      List<String> lines = singleHadeth.trim().split("\n");
      if (lines.isEmpty || lines[0].trim().isEmpty) continue;

      String title = lines[0];
      lines.removeAt(0);

      String content = lines.join("\n");

      Hadeth h = Hadeth(title: title, content: content);
      allHadeth.add(h);
    }

    if (!mounted) return;
    setState(() {});
  }
}
