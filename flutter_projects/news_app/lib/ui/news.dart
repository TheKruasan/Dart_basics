import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:build_runner/build_runner.dart';
part 'news.g.dart';

@JsonSerializable()
class News {
  final String status;
  final double totalResults;
  final List<OneNews> articles;

  News(
    this.status,
    this.totalResults,
    this.articles,
  );

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class OneNews {
  final Sourse sourse;
  final String author;
  final String title;
  final String decsription;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  OneNews(
    this.sourse,
    this.author,
    this.title,
    this.decsription,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );

  factory OneNews.fromJson(Map<String, dynamic> json) =>
      _$OneNewsFromJson(json);
  Map<String, dynamic> toJson() => _$OneNewsToJson(this);
}

@JsonSerializable()
class Sourse {
  final String id;
  final String name;
  Sourse(
    this.id,
    this.name,
  );

  factory Sourse.fromJson(Map<String, dynamic> json) => _$SourseFromJson(json);
  Map<String, dynamic> toJson() => _$SourseToJson(this);
}
