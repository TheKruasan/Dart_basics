import 'package:flutter/material.dart';
import 'package:flutter_6/for_first_part/features/scroll_panel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollTutorial(),
    );
  }
}
