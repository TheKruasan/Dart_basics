import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/hotel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/features/hotel_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  String errorMessage = '';
  List<HotelBar> hotelBars = [];
  List<Hotel> hotels = [];

  bool hasError = false;
  final Dio _dio = Dio();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await _dio
          .get("https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301");
      var data = response.data;
      hotels = data.map<Hotel>((hotel) => Hotel.fromJson(hotel)).toList();

      hotels.forEach((element) {
        hotelBars.add(
          HotelBar(hotel: element),
        );
      });
    } on DioError catch (e) {
      setState(() {
        errorMessage = e.response?.data['message'];
        isLoading = false;
        hasError = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(hotelBars);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Title"),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              for (var hot in hotelBars) hot,
            ]),
          )
        ],
      )),
    );
  }
}
