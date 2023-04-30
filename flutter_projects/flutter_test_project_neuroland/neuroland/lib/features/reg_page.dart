import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 45,
                  top: 28 - 15,
                ),
                child: Image.asset(
                  "assets/images/backArrow.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 54,
                  top: 98 + 45,
                ),
                child: Image.asset(
                  "assets/images/WaveRect.png",
                  width: 145,
                  height: 89,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
