import 'dart:convert';

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
