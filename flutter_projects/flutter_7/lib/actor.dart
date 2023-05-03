import 'package:http/http.dart' as http;
import 'dart:convert';

class Actor {
  final String name;
  final String description;

  Actor({
    required this.name,
    required this.description,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      name: json['artist'],
      description: json['about'],
    );
  }
}

Future<List> fetchActor() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/leocoderu/Flutter-SkillboxStudy/main/07_Navigation/albums_route/assets/files/artists.json'));
  List actorsList = [];
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List parsedList = jsonDecode(response.body);
    for (var element in parsedList) {
      actorsList.add(Actor.fromJson(element));
    }
    return actorsList;
  } else {
    throw Exception('Failed to load album');
  }
}
