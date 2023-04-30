import 'package:flutter/material.dart';
import 'package:neuroland/features/enter_page1.dart';
import 'package:neuroland/features/first_page.dart';
import 'package:neuroland/features/registration_form.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main': (context) => const MainApp(),
        '/first_page': (context) => const SplashScreen(),
        '/enter_page': (context) => const EnterPage(),
        '/registration_form': (context) => const FormOfRegistration(),
      },
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
