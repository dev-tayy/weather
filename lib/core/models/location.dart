import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

List<Location> locationFromJson(String str) => List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
    Location({
        required this.title,
        required this.locationType,
        required this.woeid,
        required this.lattLong,
    });

    String title;
    String locationType;
    int woeid;
    String lattLong;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
    };
}

class LatLng {
  const LatLng({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;
}

class LatLngConverter implements JsonConverter<LatLng, String> {
  const LatLngConverter();

  @override
  String toJson(LatLng latLng) {
    return '${latLng.latitude},${latLng.longitude}';
  }

  @override
  LatLng fromJson(String jsonString) {
    final parts = jsonString.split(',');
    return LatLng(
      latitude: double.tryParse(parts[0]) ?? 0,
      longitude: double.tryParse(parts[1]) ?? 0,
    );
  }
}
