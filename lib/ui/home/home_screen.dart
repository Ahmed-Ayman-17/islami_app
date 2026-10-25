import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/bottonNavItems.dart';
import 'package:islami_app/ui/home/hadeth_tap/hadeth_tap.dart';
import 'package:islami_app/ui/home/quran_tap/quran_tap.dart';
import 'package:islami_app/ui/home/radio_tap/radio_tap.dart';
import 'package:islami_app/ui/home/tasbeh_tap/tasbeh_tap.dart';
// استيراد تاب الإعدادات الجديد من الفولدر الجديد
import 'package:islami_app/ui/home/settings_tab/settings_tab.dart';
import 'package:islami_app/ui/default_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // مؤشر التاب الحالي ويبدأ بالقرآن (صفر)
  int selectedIndex = 0;

  // قائمة التابات الخمسة في التطبيق (تم إضافة SettingsTab كـ تاب خامسة)
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTap(),
    SettingsTab(), // شاشة الإعدادات الجديدة
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      title: 'Islami', // العنوان الثابت للشاشة الرئيسية
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        // جعل الشريط ثابت ويدعم أكتر من 4 عناصر بدون مشاكل في الأيقونات
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index; // تحديث التاب الحالية عند الضغط
          });
        },
        items: [
          BottonNavItems("Quran", 'quran.png'),
          BottonNavItems("Hadeth", 'quran-quran-svgrepo-com.png'),
          BottonNavItems("Tasbeh", 'sebha.png'),
          BottonNavItems("Radio", 'radio.png'),
          BottonNavItems(
            "Settings",
            'settings.png',
          ), // زرار الإعدادات السفلي (تأكد من اسم الأيقونة أو استبدلها بـ icon متاح عندك)
        ],
      ),
      body: tabs[selectedIndex], // عرض التاب الحالية بناءً على اختيار المستخدم
    );
  }
}
