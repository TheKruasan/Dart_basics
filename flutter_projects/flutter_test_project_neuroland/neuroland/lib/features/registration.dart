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
              padding: const EdgeInsets.only(bottom: 20.0, left: 10),
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
                width: 136,
                height: 124,
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
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 10, left: 24, right: 24),
            child: TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Email или телефон",
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                ),
                fillColor: Color(0xF1F1F1F1),
                filled: true,
              ),
              enabled: true,
              expands: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30, left: 24, right: 24),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Пароль",
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                ),
                fillColor: Color(0xF1F1F1F1),
                filled: true,
              ),
              obscureText: true,
              enabled: true,
              expands: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 24, right: 24),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              width: 380,
              height: 60,
              child: FloatingActionButton(
                heroTag: "EnterButton",
                backgroundColor: null,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(myController.text),
                        );
                      });
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                tooltip: '',
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 36, 33, 123),
                      Color.fromARGB(255, 58, 73, 238),
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0, left: 24, right: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              width: 380,
              height: 60,
              child: FloatingActionButton.extended(
                heroTag: "RegisterButton",
                backgroundColor: Colors.white,
                label: const Text(
                  "Рeгистрация",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
