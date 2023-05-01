import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                alignment: Alignment.center,
                width: double.infinity,
                child: FloatingActionButton.extended(
                  label: const Text("Back"),
                  heroTag: 'butn2',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                width: double.infinity,
                child: FloatingActionButton.extended(
                  label: const Text("To first Page"),
                  heroTag: 'butn2',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/first');
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: FloatingActionButton.extended(
                  heroTag: 'butn3',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text("To second Page"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  },
                ),
              ),
              Container(
                height: 400,
                alignment: Alignment.center,
                child: const Text(
                  "Third Page",
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
