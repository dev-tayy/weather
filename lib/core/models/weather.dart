// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.consolidatedWeather,
    required this.time,
    required this.title,
    required this.locationType,
    required this.woeid,
  });

  List<ConsolidatedWeather> consolidatedWeather;
  DateTime time;
  String title;
  String locationType;
  int woeid;

  Weather copyWith({
    List<ConsolidatedWeather>? consolidatedWeather,
    DateTime? time,
    String? title,
    String? locationType,
    int? woeid,
  }) =>
      Weather(
        consolidatedWeather: consolidatedWeather ?? this.consolidatedWeather,
        time: time ?? this.time,
        title: title ?? this.title,
        locationType: locationType ?? this.locationType,
        woeid: woeid ?? this.woeid,
      );

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        consolidatedWeather: List<ConsolidatedWeather>.from(
            json["consolidated_weather"]
                .map((x) => ConsolidatedWeather.fromJson(x))),
        time: DateTime.parse(json["time"]),
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
      );

  Map<String, dynamic> toJson() => {
        "consolidated_weather":
            List<dynamic>.from(consolidatedWeather.map((x) => x.toJson())),
        "time": time.toIso8601String(),
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
      };
}

class ConsolidatedWeather {
  ConsolidatedWeather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  DateTime created;
  DateTime applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  int humidity;
  double visibility;
  int predictability;

  ConsolidatedWeather copyWith({
    int? id,
    String? weatherStateName,
    String? weatherStateAbbr,
    String? windDirectionCompass,
    DateTime? created,
    DateTime? applicableDate,
    double? minTemp,
    double? maxTemp,
    double? theTemp,
    double? windSpeed,
    double? windDirection,
    double? airPressure,
    int? humidity,
    double? visibility,
    int? predictability,
  }) =>
      ConsolidatedWeather(
        id: id ?? this.id,
        weatherStateName: weatherStateName ?? this.weatherStateName,
        weatherStateAbbr: weatherStateAbbr ?? this.weatherStateAbbr,
        windDirectionCompass: windDirectionCompass ?? this.windDirectionCompass,
        created: created ?? this.created,
        applicableDate: applicableDate ?? this.applicableDate,
        minTemp: minTemp ?? this.minTemp,
        maxTemp: maxTemp ?? this.maxTemp,
        theTemp: theTemp ?? this.theTemp,
        windSpeed: windSpeed ?? this.windSpeed,
        windDirection: windDirection ?? this.windDirection,
        airPressure: airPressure ?? this.airPressure,
        humidity: humidity ?? this.humidity,
        visibility: visibility ?? this.visibility,
        predictability: predictability ?? this.predictability,
      );

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      ConsolidatedWeather(
        id: json["id"],
        weatherStateName: json["weather_state_name"],
        weatherStateAbbr: json["weather_state_abbr"],
        windDirectionCompass: json["wind_direction_compass"],
        created: DateTime.parse(json["created"]),
        applicableDate: DateTime.parse(json["applicable_date"]),
        minTemp: json["min_temp"].toDouble(),
        maxTemp: json["max_temp"].toDouble(),
        theTemp: json["the_temp"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDirection: json["wind_direction"].toDouble(),
        airPressure: json["air_pressure"].toDouble(),
        humidity: json["humidity"],
        visibility: json["visibility"].toDouble(),
        predictability: json["predictability"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created.toIso8601String(),
        "applicable_date":
            "${applicableDate.year.toString().padLeft(4, '0')}-${applicableDate.month.toString().padLeft(2, '0')}-${applicableDate.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };
}
