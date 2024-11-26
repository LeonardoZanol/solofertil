import 'package:flutter/material.dart';
import 'package:solofertil/views/MyHomePage.dart';
import 'package:solofertil/views/MyLoginPage.dart';
import 'package:solofertil/core/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 102, 255, 0)),
        useMaterial3: true
      ),
      home: const MyLoginPage(),
      initialRoute: '/',
      routes: {
        '/login': (context) => const MyLoginPage(),
        '/home': (context) => const MyHomePage()
      }
    );
  }
}