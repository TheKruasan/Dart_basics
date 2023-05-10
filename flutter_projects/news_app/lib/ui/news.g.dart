// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      json['status'] as String,
      (json['totalResults'] as num).toDouble(),
      (json['articles'] as List<dynamic>)
          .map((e) => OneNews.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

OneNews _$OneNewsFromJson(Map<String, dynamic> json) => OneNews(
      Sourse.fromJson(json['sourse'] as Map<String, dynamic>),
      json['author'] as String,
      json['title'] as String,
      json['decsription'] as String,
      json['url'] as String,
      json['urlToImage'] as String,
      json['publishedAt'] as String,
      json['content'] as String,
    );

Map<String, dynamic> _$OneNewsToJson(OneNews instance) => <String, dynamic>{
      'sourse': instance.sourse,
      'author': instance.author,
      'title': instance.title,
      'decsription': instance.decsription,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

Sourse _$SourseFromJson(Map<String, dynamic> json) => Sourse(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$SourseToJson(Sourse instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
