import 'package:flutter/material.dart';
import 'package:flutter_19_1/platform/service.dart';

void main() {
  runApp(const MainApp());
}

final PlatformService platformService = PlatformServiceImpl();

final TextEditingController _controller = TextEditingController();

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String s = "";
  bool isT = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              if (isT)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 100),
                  child: SizedBox(
                    width: 400,
                    child: TextField(
                      onEditingComplete: () => setState(() {
                        s = _controller.text;
                      }),
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              if (!isT)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 100),
                  child: SizedBox(
                    width: 400,
                    child: TextField(
                      onChanged: (value) => setState(
                        () {
                          s = value;
                        },
                      ),
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              Center(
                child: Text(
                  '${platformService.getValue_s(s)}',
                  style: const TextStyle(fontSize: 86),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                isT = !isT;
              });
            },
            label: const Icon(Icons.accessible_forward_sharp)),
      ),
    );
  }
}
