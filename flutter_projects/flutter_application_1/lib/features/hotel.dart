import 'package:json_annotation/json_annotation.dart';

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

@JsonSerializable()
class AboutHotel {
  final String? uuid;
  final String? name;
  final String? poster;
  final double? price;
  final double? rating;
  final HotelAdress? adress;
  final Services? services;
  final List<String>? photos;
  AboutHotel({
    required this.uuid,
    required this.name,
    required this.poster,
    required this.price,
    required this.rating,
    required this.adress,
    required this.services,
    required this.photos,
  });

  factory AboutHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutHotelFromJson(json);
  Map<String, dynamic> toJson() => _$AboutHotelToJson(this);
}

@JsonSerializable()
class HotelAdress {
  final String country;
  final String street;
  final String city;
  @JsonKey(name: 'zip_code')
  final double zipcode;
  final Coords coords;
  HotelAdress({
    required this.country,
    required this.street,
    required this.city,
    required this.zipcode,
    required this.coords,
  });

  factory HotelAdress.fromJson(Map<String, dynamic> json) =>
      _$HotelAdressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAdressToJson(this);
}

@JsonSerializable()
class Coords {
  final double lat;
  final double lan;
  Coords({
    required this.lan,
    required this.lat,
  });

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}

@JsonSerializable()
class Services {
  final List<String> free;
  final List<String> paid;
  Services({
    required this.free,
    required this.paid,
  });

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}
