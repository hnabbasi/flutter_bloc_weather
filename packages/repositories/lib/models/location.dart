import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  @JsonKey(name: "city")
  final String cityName;
  @JsonKey(name: "state")
  final String stateName;
  final double lat;
  final double long;
  final String cwa;
  final int gridX;
  final int gridY;
  @JsonKey(name: "forecast")
  final String forecastUrl;
  @JsonKey(name: "forecastHourly")
  final String hourlyForecastUrl;
  final String observationStations;

  const Location({
    required this.cityName,
    required this.stateName,
    required this.lat,
    required this.long,
    required this.cwa,
    required this.gridX,
    required this.gridY,
    required this.forecastUrl,
    required this.hourlyForecastUrl,
    required this.observationStations
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static final empty = Location(cityName: "", stateName: "", lat: 0, long: 0, cwa: "", gridX: 0, gridY: 0, forecastUrl: "", hourlyForecastUrl: "", observationStations: "");

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.cityName;
    data['state'] = this.stateName;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['cwa'] = this.cwa;
    data['gridX'] = this.gridX;
    data['gridY'] = this.gridY;
    data['forecast'] = this.forecastUrl;
    data['forecastHourly'] = this.hourlyForecastUrl;
    data['observationStations'] = this.observationStations;
    return data;
  }
}