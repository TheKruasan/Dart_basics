import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextFieldExample(),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: const TextField(
            decoration: InputDecoration(
              label: Text("Search"),
              hoverColor: Colors.pink,
              fillColor: Colors.pink,
              focusColor: Colors.pink,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.pink,
                  style: BorderStyle.none,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.pink,
                  style: BorderStyle.none,
                  width: 1.0,
                ),
              ),
              hintText: "search something",
              helperText: "helper text",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.pink,
                  style: BorderStyle.none,
                  width: 10.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
