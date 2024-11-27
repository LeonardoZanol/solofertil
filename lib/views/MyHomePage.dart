import 'package:flutter/material.dart';
import 'package:solofertil/views/MyCalcCtcPage.dart';
import 'package:solofertil/views/MyCalcDensidadePage.dart';
import 'package:solofertil/views/MyCalcPhSoloPage.dart';
import 'package:solofertil/views/MyCalculatorPage.dart';
import 'package:solofertil/views/MyDashboardPage.dart';
import 'package:solofertil/views/MyTipsPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int actualyPage = 1;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: actualyPage);
  }

  setActualyPage(page) {
    setState(() {
      actualyPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          MyDashboardPage(),
          MyTipsPage(),
          MyCalculatorPage(),
        ],
        onPageChanged: setActualyPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:actualyPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: 'Relatórios'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate), label: 'Calculadora'
          )
        ],
        onTap: (page) {
          pc.animateToPage(
            page, 
            duration: const Duration(microseconds: 400), 
            curve: Curves.ease
          );
        },
      ),
    );
  }
}