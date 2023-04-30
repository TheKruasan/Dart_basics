import 'package:flutter/material.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
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
          //Widget with arrow photo on top

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

          //Widget with Logo

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

          //Two widgets with Text fields

          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 10, left: 24, right: 24),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Email или телефон",
                hintStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                ),
                fillColor: const Color(0xF1F1F1F1),
                filled: true,
              ),
              enabled: true,
              expands: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Пароль",
                hintStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                ),
                fillColor: const Color(0xF1F1F1F1),
                filled: true,
              ),
              obscureText: true,
              enabled: true,
              expands: false,
            ),
          ),

          //Enter button

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

          //Registration button

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
                onPressed: () {
                  Navigator.pushNamed(context, '/registration_form');
                },
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
