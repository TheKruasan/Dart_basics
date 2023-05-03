// import 'package:flutter/material.dart';

// class DrawerPage extends StatefulWidget {
//   const DrawerPage(
//     Key? key,
//     this.scaffoldKey,
//   ) : super(key: key);
//   final GlobalKey<ScaffoldState>? scaffoldKey;
//   @override
//   State<DrawerPage> createState() => _DrawerPageState();
// }

// class _DrawerPageState extends State<DrawerPage> {
//   // final GlobalKey<ScaffoldState>? _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.asset('assets/images/7292.png'),
//         ListTile(
//           tileColor: Colors.blue,
//           subtitle: const Text('home page'),
//           leading: const Icon(Icons.home),
//           trailing: const Icon(Icons.arrow_forward),
//           title: const Text("Home"),
//           onTap: () {
//             scaffoldKey?.currentState?.closeDrawer();
//           },
//         ),
//         ListTile(
//           leading: const Icon(Icons.accessibility_rounded),
//           trailing: const Icon(Icons.arrow_forward),
//           title: const Text("Actors"),
//           onTap: () {
//             Navigator.of(context).pushNamed('/second');
//           },
//         ),
//       ],
//     );
//   }
// }
