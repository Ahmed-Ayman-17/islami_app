import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/hadeth-details/hadeth-details.dart';
import 'package:islami_app/ui/splash/ui_uties.dart';

// نموذج بيانات الحديث (Data Model) لتخزين عنوان الحديث ونص محتواه
class Hadeth {
  String title;
  String content;
  Hadeth({required this.title, required this.content});
}

// الشاشة الرئيسية لتبويب الأحاديث
class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  // قائمة لتخزين جميع الأحاديث بعد قراءتها من الملف
  List<Hadeth> allHadeth = [];

  @override
  void initState() {
    super.initState();
    // استدعاء دالة قراءة الملف فور فتح الصفحة لأول مرة
    readHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // عرض الشعار (اللوجو) العلوي المستوحى من فيجما
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Image.asset(
              getFullPathImage('hadith_header.png'),
              height: 130,
            ),
          ),
        ),

        // خط فاصل علوي
        Container(width: double.infinity, height: 2, color: Colors.brown),

        // عنوان القسم "الأحاديث"
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'الأحاديث',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),

        // خط فاصل سفلي
        Container(width: double.infinity, height: 2, color: Colors.brown),

        // عرض القائمة أو شاشة التحميل إذا كانت البيانات لم تكتمل بعد
        Expanded(
          child: allHadeth.isEmpty
              ? const Center(child: CircularProgressIndicator()) // مؤشر التحميل
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // الانتقال لصفحة تفاصيل الحديث وإرسال الحديث الحالي كمُعامل (Arguments)
                        Navigator.pushNamed(
                          context,
                          HadethDetails.routeName,
                          arguments: allHadeth[index],
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          allHadeth[index].title, // عرض عنوان الحديث في القائمة
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    );
                  },
                  // الفاصل المرئي بين الأحاديث في القائمة
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.brown,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                  ),
                  itemCount: allHadeth.length,
                ),
        ),
      ],
    );
  }

  // دالة قراءة ملف الأحاديث النصي وتقسيمه باستخدام الرمز #
  void readHadethFile() async {
    // قراءة محتوى الملف بالكامل كنص واحد من مجلد الـ assets
    String fileContent = await rootBundle.loadString(
      'assets/files/ahadeth.txt',
    );

    // تقسيم الملف إلى أجزاء بناءً على علامة # (كل جزء يمثل حديثاً مستقلاً)
    List<String> separatedAhadeth = fileContent.split("#");

    for (int i = 0; i < separatedAhadeth.length; i++) {
      String singleHadeth = separatedAhadeth[i];

      // تقسيم الحديث الواحد إلى أسطر بناءً على السطر الجديد \n
      List<String> lines = singleHadeth.trim().split("\n");
      if (lines.isEmpty || lines[0].trim().isEmpty) continue;

      // السطر الأول يعتبر هو عنوان الحديث (مثل: الحديث الأول)
      String title = lines[0];
      lines.removeAt(0); // إزالة العنوان من السطور

      // دمج باقي السطور معاً لتصبح نص الحديث الكامل في متغير واحد
      String content = lines.join("\n");

      // إنشاء كائن الحديث وإضافته للقائمة
      Hadeth h = Hadeth(title: title, content: content);
      allHadeth.add(h);
    }

    // إعادة بناء الشاشة بعد اكتمال تحميل الأحاديث لعرضها
    setState(() {});
  }
}
