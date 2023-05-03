// import 'package:flutter/material.dart';

// class ThirdPage extends StatelessWidget {
//   static const String routeName = "/third";
//   ThirdPage({super.key});
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: const Text("Artists"),
//         ),
//         drawer: Drawer(
//           backgroundColor: Colors.white,
//           child: Column(
//             children: [
//               Image.asset('assets/images/7292.png'),
//               ListTile(
//                 tileColor: Colors.blue,
//                 subtitle: const Text('home page'),
//                 leading: const Icon(Icons.home),
//                 trailing: const Icon(Icons.arrow_forward),
//                 title: const Text("Home"),
//                 onTap: () {
//                   _scaffoldKey.currentState?.closeDrawer();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.accessibility_rounded),
//                 trailing: const Icon(Icons.arrow_forward),
//                 title: const Text("Actors"),
//                 onTap: () {
//                   Navigator.of(context).pushNamed('/second');
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
