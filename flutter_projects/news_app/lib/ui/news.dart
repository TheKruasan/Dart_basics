// import 'package:json_annotation/json_annotation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// // part 'news.g.dart';

// @JsonSerializable()
// class OneNews {
//   final Sourse? sourse;
//   final String? author;
//   final String? title;
//   final String? decsription;
//   final String? url;
//   final String? urlToImage;
//   final String? publishedAt;
//   final String? content;
//   OneNews({
//     this.sourse,
//     this.author,
//     this.title,
//     this.decsription,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });

//   factory OneNews.fromJson(Map<String, dynamic> json) {
//     return OneNews(
//       sourse: json['sourse'],
//       author: json['author'],
//       title: json['title'],
//       decsription: json['decsription'],
//       url: json['url'],
//       urlToImage: json['urlToImage'],
//       publishedAt: json['publishedAt'],
//       content: json['content'],
//     );
//   }
// }

// @JsonSerializable()
// class Sourse {
//   final String? id;
//   final String? name;
//   Sourse({
//     this.id,
//     this.name,
//   });

//   factory Sourse.fromJson(Map<String, dynamic> json) {
//     return Sourse(
//       id: json['id'],
//       name: json['author'],
//     );
//   }
// }

// Future<List> fetchNews() async {
//   final response = await http.get(Uri.parse(
//       'https://newsapi.org/v2/top-headlines?q=Apple&sortBy=popularity&apiKey=a088be1c628f40549f60536de0e8c144'));
//   List<OneNews> newsList = [];

//   if (response.statusCode == 200) {
//     var a = response.body as Map<String, dynamic>;
//     List b = a['articles'];
//     print(b);
//     List parsedList = jsonDecode(response.body);

//     // print(parsedList);
//     for (var element in parsedList) {
//       newsList.add(OneNews.fromJson(element));
//     }
//     // print(newsList.first.title);
//     return newsList;
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
