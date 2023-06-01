// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_18_3/features/presentation/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: Scaffold(),
    );
  }
}
