library repositories;

import 'package:json_annotation/json_annotation.dart';
import 'package:repositories/models/models.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final Location location;
  final String timestamp;
  final String textDescription;
  final String icon;
  final UnitValue temperature;
  final UnitValue dewPoint;
  final UnitValue windDirection;
  final UnitValue windSpeed;
  final UnitValue visibility;
  final UnitValue relativeHumidity;
  final UnitValue windChill;
  final UnitValue heatIndex;

  Weather(
      { required this.location,
        required this.timestamp,
        required this.textDescription,
        required this.icon,
        required this.temperature,
        required this.dewPoint,
        required this.windDirection,
        required this.windSpeed,
        required this.visibility,
        required this.relativeHumidity,
        required this.windChill,
        required this.heatIndex
      });

  factory Weather.fromJson(Map<String, dynamic> json) =>
    _$WeatherFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['timestamp'] = this.timestamp;
    data['textDescription'] = this.textDescription;
    data['icon'] = this.icon;
    data['temperature'] = this.temperature.toJson();
    data['dewpoint'] = this.dewPoint.toJson();
    data['windDirection'] = this.windDirection.toJson();
    data['windSpeed'] = this.windSpeed.toJson();
    data['visibility'] = this.visibility.toJson();
    data['relativeHumidity'] = this.relativeHumidity.toJson();
    data['windChill'] = this.windChill.toJson();
    data['heatIndex'] = this.heatIndex.toJson();
    return data;
  }
}

@JsonSerializable()
class UnitValue {
  final String unit;
  final double? value;

  UnitValue({required this.unit, required this.value});

  static final empty = UnitValue(unit: "", value: 0);

  factory UnitValue.fromJson(Map<String, dynamic> json) =>
    _$UnitValueFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unitCode'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}