import 'package:flutter/material.dart';
import 'package:flutter_9/pages/home_page.dart';

void main() {
  return (runApp(MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) {
            return const HomePage();
          });
        },
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(builder: (BuildContext context) {
                return const HomePage();
              });

            default:
              return MaterialPageRoute(
                builder: (BuildContext context) {
                  return const HomePage();
                },
              );
          }
        },
        home: const HomePage());
  }
}
