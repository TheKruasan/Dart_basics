import 'package:flutter/material.dart';
import 'package:flutter_7/first_page.dart';
import 'package:flutter_7/secong_page.dart';
import 'package:flutter_7/third_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return FirstPage();
        });
      },
      routes: {
        '/': (BuildContext context) => FirstPage(),
        '/second': (BuildContext context) => SecondPage(),
        '/third': (BuildContext context) => const ThirdPage()
      },
    );
  }
}
