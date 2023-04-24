import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 65.0, left: 10),
              child: Image.asset(
                "assets/images/arrow.png",
                width: 166,
                height: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/LOGO.png",
              width: 320,
              height: 106,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0, right: 0, top: 31),
              child: Image.asset(
                "assets/images/rightArrow.png",
                width: 166,
                height: 150,
              ),
            ),
          ),
          const Text(
            "Вход в аккаунт",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              fontFamily: 'Roboto',
            ),
          ),
          const Padding(
            padding:
                EdgeInsets.only(top: 30.0, bottom: 10, left: 24, right: 24),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email или телефон",
                fillColor: Color(0xF1F1F1F1),
                filled: true,
              ),
              enabled: true,
              expands: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, left: 24, right: 24),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Пароль",
                fillColor: Color(0xF1F1F1F1),
                filled: true,
              ),
              obscureText: true,
              enabled: true,
              expands: false,
            ),
          ),
        ],
      ),
    );
  }
}
