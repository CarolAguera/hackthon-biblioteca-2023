import 'package:flutter/material.dart';
import 'package:hackthon_biblioteca_2023/screens/AllBooksScreen.dart';
import 'package:hackthon_biblioteca_2023/screens/LoginScreen.dart';
import 'package:hackthon_biblioteca_2023/screens/MainMenuScreen.dart';
import 'package:hackthon_biblioteca_2023/screens/StudentProfileScreen.dart';

import 'assets/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData,
      home: const LoginScreen(),
      routes: {
        '/login': (ctx) => const LoginScreen(),
        '/books': (ctx) => const AllBooksScreen(),
        '/menu': (ctx) => MainMenuScreen(),
      },
    );
  }
}
