import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/bottonNavItems.dart';
import 'package:islami_app/ui/home/hadeth_tap/hadeth_tap.dart';
import 'package:islami_app/ui/home/quran_tap/quran_tap.dart';
import 'package:islami_app/ui/home/radio_tap/radio_tap.dart';
import 'package:islami_app/ui/home/tasbeh_tap/tasbeh_tap.dart';
// متنساش تعمل Import للـ DefaultScreen
import 'package:islami_app/ui/default_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTap()];

  @override
  Widget build(BuildContext context) {
    // استخدام الـ DefaultScreen
    return DefaultScreen(
      title: 'Islami', // العنوان الثابت للشاشة الرئيسية
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottonNavItems("Quran", 'quran.png'),
          BottonNavItems("Hadeth", 'quran-quran-svgrepo-com.png'),
          BottonNavItems("Tasbeh", 'sebha.png'),
          BottonNavItems("Radio", 'radio.png'),
        ],
      ),
      body: tabs[selectedIndex], // الـ Body هنا هو الـ Tab اللي اليوزر اختاره
    );
  }
}
