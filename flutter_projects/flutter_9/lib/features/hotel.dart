// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:build_runner/build_runner.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable()
class Hotel {
  final String name;
  final String poster;
  final String uuid;

  Hotel({
    required this.name,
    required this.poster,
    required this.uuid,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}
