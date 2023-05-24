import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:news_app/ui/news_card.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> data = ['List', "List_alt"];
  final List<Icon> nav = const [Icon(Icons.list), Icon(Icons.list_alt)];
  List<Article> newsFirst = [];
  List<Article> newsSecond = [];

  bool hasError = false;
  final Dio _dio = Dio();

  final String apiKey = "a088be1c628f40549f60536de0e8c144";
  String url =
      "https://newsapi.org/v2/everything?q=Russia&from=2023-05-8&sortBy=popularity&apiKey=a088be1c628f40549f60536de0e8c144";
  String url_2 =
      "https://newsapi.org/v2/top-headlines?q=Russia&from=2023-05-8&sortBy=popularity&apiKey=a088be1c628f40549f60536de0e8c144";

  Future<List<Article>> getDataSecond() async {
    try {
      final response = await _dio.get(url_2);
      var data = response.data;
      OneNews welcome = OneNews.fromJson(data);
      newsSecond = welcome.articles;
      return newsSecond;
    } on DioError catch (e) {
      setState(() {
        hasError = true;
      });
      return [];
    }
  }

  Future<List<Article>> getDataFirst() async {
    try {
      final response = await _dio.get(url);
      var data = response.data;
      OneNews welcome = OneNews.fromJson(data);
      newsFirst = welcome.articles;
      return newsFirst;
    } on DioError catch (e) {
      setState(() {
        hasError = true;
      });
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
          Tab(
            child: FutureBuilder(
              future: getDataFirst(),
              builder: ((context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              if (snapshot.hasData)
                                for (var article in snapshot.data!)
                                  NewsBar(article: article),
                            ],
                          ),
                        )
                      ],
                    );

                  default:
                    return const Text("Loading...");
                }
              }),
            ),
          ),
          Tab(
            child: FutureBuilder(
              future: getDataSecond(),
              builder: ((context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              if (snapshot.hasData)
                                for (var article in snapshot.data!)
                                  NewsBar(article: article),
                            ],
                          ),
                        )
                      ],
                    );

                  default:
                    return const Text("Loading...");
                }
              }),
            ),
          ),
        ]),
      ),
    );
  }
}
