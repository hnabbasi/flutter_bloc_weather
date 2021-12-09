import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:practical_weather/weather/models/location.dart';
import 'package:repositories/exports.dart' as repo;

part 'weather.g.dart';

enum TemperatureUnits { fahrenheit, celsius }

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

@JsonSerializable()
class Temperature extends Equatable {
  final double value;

  Temperature({required this.value});

  factory Temperature.fromJson(Map<String, dynamic> json) =>
    _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  @override
  List<Object> get props => [value];
}

@JsonSerializable()
class Weather extends Equatable {
  final Location location;
  final Temperature temperature;
  final String timestamp;

  const Weather({
    required this.location,
    required this.temperature,
    required this.timestamp
  });

  factory Weather.fromRepository(repo.Weather weather) {
    return Weather(
      location: Location(cityName: weather.location.cityName, stateName: weather.location.stateName),
      temperature: Temperature(value: weather.temperature.value ?? 0.0),
      timestamp: weather.timestamp,
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) =>
    _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  static final empty = Weather(
    temperature: Temperature(value: 0),
    location: Location(cityName: "", stateName: ""),
    timestamp: ""
  );

  @override
  List<Object> get props => [location, temperature, timestamp];

  Weather copyWith({
    Location? location,
    Temperature? temperature,
    String? timestamp
  }) {
    return Weather(
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
      timestamp: timestamp ?? this.timestamp
    );
  }
}

