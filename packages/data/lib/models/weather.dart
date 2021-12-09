library data;

import 'package:data/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: "@id")
  final String id;
  @JsonKey(name: "@type")
  final String type;
  final Location location;
  final String station;
  final String timestamp;
  final String rawMessage;
  final String textDescription;
  final String icon;
  final UnitCodeValue temperature;
  final UnitCodeValue dewpoint;
  final UnitCodeValue windDirection;
  final UnitCodeValue windSpeed;
  final UnitCodeValue visibility;
  final UnitCodeValue relativeHumidity;
  final UnitCodeValue windChill;
  final UnitCodeValue heatIndex;

  const Weather(
      { required this.id,
        required this.type,
        required this.location,
        required this.station,
        required this.timestamp,
        required this.rawMessage,
        required this.textDescription,
        required this.icon,
        required this.temperature,
        required this.dewpoint,
        required this.windDirection,
        required this.windSpeed,
        required this.visibility,
        required this.relativeHumidity,
        required this.windChill,
        required this.heatIndex
      });

  factory Weather.fromJson(Map<String, dynamic> json) {
    if(!json.containsKey('location'))
      json['location'] = Location.empty.toJson();
    return _$WeatherFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['location'] = this.location.toJson();
    data['station'] = this.station;
    data['timestamp'] = this.timestamp;
    data['rawMessage'] = this.rawMessage;
    data['textDescription'] = this.textDescription;
    data['icon'] = this.icon;
    data['temperature'] = this.temperature.toJson();
    data['dewpoint'] = this.dewpoint.toJson();
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
class UnitCodeValue {
  final String unitCode;
  final double? value;
  final String qualityControl;

  const UnitCodeValue({required this.unitCode, required this.value, required this.qualityControl});

  static final empty = UnitCodeValue(unitCode: "", value: 0.0, qualityControl: "");

  factory UnitCodeValue.fromJson(Map<String, dynamic> json) =>
    _$UnitCodeValueFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unitCode'] = this.unitCode;
    data['value'] = this.value;
    data['qualityControl'] = this.qualityControl;
    return data;
  }
}