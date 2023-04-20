import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  List<String> fakeData1 = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg'
  ];
  List<String> fakeData2 = [
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg'
  ];
  List<String> nav = ['Мужчины', 'Женщины'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Keys'),
          bottom: TabBar(
            tabs: nav.map((String item) => Tab(text: item)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
                key: PageStorageKey(nav[0]),
                children: fakeData1.map((item) => Image.asset(item)).toList()),
            ListView(
                key: PageStorageKey(nav[1]),
                children: fakeData2.map((item) => Image.asset(item)).toList()),
          ],
        ),
      ),
    ));
  }
}
