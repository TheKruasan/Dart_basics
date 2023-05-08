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

AboutHotel _$AboutHotelFromJson(Map<String, dynamic> json) => AboutHotel(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      poster: json['poster'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      adress: json['adress'] == null
          ? null
          : HotelAdress.fromJson(json['adress'] as Map<String, dynamic>),
      services: json['services'] == null
          ? null
          : Services.fromJson(json['services'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AboutHotelToJson(AboutHotel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'price': instance.price,
      'rating': instance.rating,
      'adress': instance.adress,
      'services': instance.services,
      'photos': instance.photos,
    };

HotelAdress _$HotelAdressFromJson(Map<String, dynamic> json) => HotelAdress(
      country: json['country'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      zipcode: (json['zip_code'] as num).toDouble(),
      coords: Coords.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelAdressToJson(HotelAdress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zipcode,
      'coords': instance.coords,
    };

Coords _$CoordsFromJson(Map<String, dynamic> json) => Coords(
      lan: (json['lan'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      free: (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      paid: (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
