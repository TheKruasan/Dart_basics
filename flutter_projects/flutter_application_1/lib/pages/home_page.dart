import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/hotel.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<Hotel> _hotels = [];

  Dio _dio = Dio();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    final response = await _dio
        .get("https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301");
    var data = response.data;
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Title"),
      ),
      body: SafeArea(
          child: Container(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        ),
      )),
    );
  }
}
