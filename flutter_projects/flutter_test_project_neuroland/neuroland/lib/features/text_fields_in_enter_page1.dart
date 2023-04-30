// import 'package:flutter/material.dart';

// class EnterFieldInRegistration extends StatelessWidget {
//   EnterFieldInRegistration({
//     Key? key,
//     this.bot,
//     this.left,
//     this.right,
//     this.top,
//     this.myController,
//     this.text,
//   }) : super(key: key);
//   final myController;
//   String? text;
//   final bot, top, left, right;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Padding(
//       padding: EdgeInsets.only(
//         top: top,
//         bottom: bot,
//         left: left,
//         right: right,
//       ),
//       child: TextField(
//         controller: myController,
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//           hintText: "Email или телефон",
//           hintStyle: TextStyle(
//             fontFamily: 'Roboto',
//             fontSize: 20,
//           ),
//           fillColor: Color(0xF1F1F1F1),
//           filled: true,
//         ),
//         enabled: true,
//         expands: false,
//       ),
//     ));
//   }
// }
