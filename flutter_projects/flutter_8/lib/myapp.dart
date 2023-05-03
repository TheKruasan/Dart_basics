import 'package:flutter/material.dart';
import 'package:flutter_8/fetch_file.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller = TextEditingController();
  String _textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Enter Text",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                        controller: _controller,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Container(
                          height: 59,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Colors.black),
                          child: const Center(
                            child: Text(
                              'Найти',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _textFieldValue = _controller.text;
                          });
                          print(_controller.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: FutureBuilder(
                    future: fetchFileFromAssets(
                        "assets/files/$_textFieldValue.txt"),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return LinearProgressIndicator();
                          break;
                        case ConnectionState.done:
                          return Column(
                            children: [
                              Text(
                                _textFieldValue,
                              ),
                              Text(
                                snapshot.data.toString(),
                              ),
                            ],
                          );

                        default:
                          return const Text("not found");
                      }
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
