import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neuroland/features/enter_page1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const EnterPage()));
    });
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/LOGO.png",
        width: 350,
      ),
    );
  }
}
