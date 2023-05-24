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
  AboutHotel aboutHotel = AboutHotel(
    uuid: "uuid",
    name: "Name",
    poster: "poster",
    price: 0,
    rating: 0,
    adress: HotelAdress(
      country: "country",
      street: "street",
      city: "city",
      zipcode: 0,
      coords: Coords(
        lan: 0,
        lat: 0,
      ),
    ),
    services: Services(
      free: [],
      paid: [],
    ),
    photos: [],
  );

  bool hasError = false;
  final Dio _dio = Dio();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData([String s = "ac888dc5-d193-4700-b12c-abb43e289301"]) async {
    setState(() {
      isLoading = true;
    });
    try {
      if (s == "ac888dc5-d193-4700-b12c-abb43e289301") {
        final response = await _dio.get("https://run.mocky.io/v3/${s}");
        var data = response.data;
        hotels = data.map<Hotel>((hotel) => Hotel.fromJson(hotel)).toList();
      } else {
        final response = await _dio.get("https://run.mocky.io/v3/${s}");
        var data = response.data;
        aboutHotel = AboutHotel.fromJson(data);
      }

      for (var element in hotels) {
        try {
          getData(element.uuid);
          hotelBars.add(
            HotelBar(
              hotel: element,
              aboutHotel: aboutHotel,
            ),
          );
        } on DioError catch (e) {
          setState(() {
            errorMessage = e.response?.data['message'];
            isLoading = false;
            hasError = true;
          });
        }
      }
    } on DioError catch (e) {
      setState(() {
        hasError = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  bool isList = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isList = true;
              });
            },
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isList = false;
              });
            },
            icon: Icon(Icons.grid_view_sharp),
          ),
        ],
        centerTitle: true,
        title: const Text("Title"),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          if (isList)
            SliverList(
              delegate: SliverChildListDelegate([
                for (var hot in hotelBars) hot,
              ]),
            ),
          if (!isList)
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return hotelBars[index];
              },
              itemCount: hotelBars.length,
            ),
        ],
      )),
    );
  }
}
