import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/hotel_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return HomePage();
              },
            );
          // case HotelPage.routeName:
          //   final args = settings.arguments as Map<String, dynamic>;
          //   return MaterialPageRoute(builder: (BuildContext context) {
          //     if (args.containsKey('hotel')) {
          //       return HotelPage(

          //       );
          //     }
          //   });
          default:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return HomePage();
              },
            );
        }
      },
      home: HomePage(),
    );
  }
}
