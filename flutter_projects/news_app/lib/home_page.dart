import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/ui/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> data = ['List', "List_alt"];
  final List<Icon> nav = const [Icon(Icons.list), Icon(Icons.list_alt)];
  late final News news;

  // late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(vsync: this, length: nav.length);
  }

  void getData



  final String apiKey = "38823f356abb4c6d9fa19f68dd78b40b";
  String url = "https://newsapi.org/v2/everything?" +
      "q=Steam&" +
      "from=2023-05-8&" +
      "sortBy=popularity&" +
      "apiKey=38823f356abb4c6d9fa19f68dd78b40b";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Top headlines"),
          bottom: TabBar(
            // controller: _tabController,
            tabs: nav.map((Icon icon) {
              return Tab(
                icon: icon,
              );
            }).toList(),
          ),
        ),
        body: TabBarView(children: [
          ListView(
            key: PageStorageKey(data[0]),
            children: [Text(url)],
          ),
          ListView(
            key: PageStorageKey(data[1]),
            children: [Text("1234567")],
          ),
        ]),
      ),
    );
  }
}
