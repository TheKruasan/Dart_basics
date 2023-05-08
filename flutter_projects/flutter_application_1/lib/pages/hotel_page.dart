// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_application_1/features/hotel.dart';

// class HotelPage extends StatefulWidget {
//   Hotel hotel;
//   HotelPage({required this.hotel,super.key,});
// static const routeName = '/hotel';
//   @override
//   State<HotelPage> createState() => _HotelPageState();
// }

// class _HotelPageState extends State<HotelPage> {



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: CarouselSlider(
//             options: CarouselOptions(height: 400.0),
//             items: imgList.map((i) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: BoxDecoration(
//                         color: Colors.amber,
//                         image: DecorationImage(
//                           image: NetworkImage(i),
//                         )),
//                   );
//                 },
//               );
//             }).toList(),
//           ),,
//       ),
//     );
//   }
// }
