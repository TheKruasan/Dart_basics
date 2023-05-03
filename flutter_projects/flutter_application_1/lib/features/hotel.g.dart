// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      poster: json['poster'] as String,
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'poster': instance.poster,
    };
