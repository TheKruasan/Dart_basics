import 'package:flutter/material.dart';
import 'package:flutter_7/actors_page.dart';
import 'package:flutter_7/first_page.dart';
import 'package:flutter_7/secong_page.dart';
import 'package:flutter_7/third_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return FirstPage();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case FirstPage.routeName:
            return MaterialPageRoute(builder: (context) => FirstPage());
          case SecondPage.routeName:
            return MaterialPageRoute(builder: (context) => const SecondPage());
          case ActorPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;

            return MaterialPageRoute(builder: (BuildContext context) {
              if (args.containsKey('actor')) {
                return ActorPage(
                  actor: args['actor'],
                );
              }
              return const Text("Fail");
            });
        }
        return null;
      },
    );
  }
}
