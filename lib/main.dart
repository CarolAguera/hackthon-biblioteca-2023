import 'package:flutter/material.dart';
import 'package:hackthon_biblioteca_2023/screens/AllBooksScreen.dart';
import 'package:hackthon_biblioteca_2023/screens/LoginScreen.dart';

import 'assets/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData,
      home: LoginScreen(),
      routes: {
        '/login': (ctx) => LoginScreen(),
        '/books': (ctx) => AllBooksScreen(),
      },
    );
  }
}
