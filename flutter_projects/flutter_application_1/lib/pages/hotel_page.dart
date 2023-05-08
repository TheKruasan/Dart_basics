import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/hotel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotelPage extends StatefulWidget {
  AboutHotel hotel;

  HotelPage({
    required this.hotel,
    super.key,
  });
  static const routeName = '/hotel';
  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    List<String>? images = widget.hotel.photos;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotel.name!),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: images?.map((e) {
              return Image.asset(
                "assets/images/${e}",
              );
            }).toList(),
            options: CarouselOptions(
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
