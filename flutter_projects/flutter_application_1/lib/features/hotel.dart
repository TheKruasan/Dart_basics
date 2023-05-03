import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
import 'package:build_runner/build_runner.dart';

part 'hotel.g.dart';

@JsonSerializable()
class Hotel {
  final String name;
  final String uuid;
  final String poster;

  Hotel({
    required this.name,
    required this.uuid,
    required this.poster,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}
