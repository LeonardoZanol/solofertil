import 'package:flutter/material.dart';
import 'package:solofertil/views/MyForgotPasswordPage.dart';
import 'package:solofertil/views/MyHomePage.dart';

import 'package:solofertil/core/constants.dart';
import 'package:solofertil/views/MyLoginPage.dart';
import 'package:solofertil/views/MyRegisterPage.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true
      ),
      home: const MyLoginPage(),
      initialRoute: '/',
      routes: {
        '/home': (context) => const MyHomePage(),
        '/register': (context) => const MyRegisterPage(),
        '/forgotpasswd': (context) => const MyForgotPasswordPage()
      }
    );
  }
}