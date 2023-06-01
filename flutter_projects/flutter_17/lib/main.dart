import 'package:flutter/material.dart';
import 'package:flutter_17/features/presentation/pages/home_page.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: Scaffold(),
    );
  }
}
