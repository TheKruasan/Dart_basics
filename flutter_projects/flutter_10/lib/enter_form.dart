import 'package:flutter/material.dart';

class EnterForm extends StatefulWidget {
  const EnterForm({super.key});

  @override
  State<EnterForm> createState() => _EnterFormState();
}

class _EnterFormState extends State<EnterForm> {
  bool isEnter = false;
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (isEnter)
              TextFormField(
                key: const Key("Name"),
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ),
            if (isEnter)
              TextFormField(
                key: const Key("lastName"),
                decoration: const InputDecoration(
                  hintText: "SirName",
                ),
              ),
            if (isEnter)
              TextFormField(
                key: const Key("EnterLogin"),
                decoration: const InputDecoration(
                  hintText: "Emai",
                ),
              ),
            if (isEnter)
              TextFormField(
                obscureText: true,
                key: const Key("EnterPassword"),
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
            if (isEnter)
              GestureDetector(
                child: Container(
                  height: 59,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: const Center(
                    child: Text(
                      'Switch to enter form',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    isEnter = false;
                  });
                },
              ),
            if (!isEnter)
              TextFormField(
                key: const Key("RegLogin"),
                decoration: const InputDecoration(
                  hintText: "Login/email",
                ),
              ),
            if (!isEnter)
              TextFormField(
                obscureText: true,
                key: const Key("RegPassword"),
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ),
            if (!isEnter)
              GestureDetector(
                child: Container(
                  height: 59,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: const Center(
                    child: Text(
                      'Switch to registration form',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    isEnter = true;
                  });
                },
              ),
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 59,
                decoration: const BoxDecoration(color: Colors.grey),
                child: const Center(
                  child: Text(
                    'Enter',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  isLoad = isLoad ? false : true;
                });
              },
            ),
            if (isLoad)
              const Text(
                "Отправлено",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
          ],
        ),
      )),
    );
  }
}
