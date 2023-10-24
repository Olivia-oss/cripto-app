import 'dart:convert';
import 'package:cripto_app/config/utilis/map_utils.dart';

List<Venue> venueFromJson(List<dynamic> data) =>
    List<Venue>.from(data.map((x) => Venue.fromJson(x)));

String venueToJson(List<Venue> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Venue {
  final int id;
  final double lat;
  final double lon;
  final String category;
  final String name;
  final int createdOn;
  final String geolocationDegrees;

  Venue({
    required this.id,
    required this.lat,
    required this.lon,
    required this.category,
    required this.name,
    required this.createdOn,
    required this.geolocationDegrees,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        category: json["category"],
        name: json["name"],
        createdOn: json["created_on"],
        geolocationDegrees: json["geolocation_degrees"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "lon": lon,
        "category": category,
        "name": name,
        "created_on": createdOn,
        "geolocation_degrees": geolocationDegrees,
      };

  Future<String> get getAdress async {
    return MapUtils.getAdressName(lat, lon);
    //return await placemarkFromCoordinates(lat, lon);
  }
}
