// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return $checkedNew('Temperature', json, () {
    final val = Temperature(
      value: $checkedConvert(json, 'value', (v) => (v as num).toDouble()),
    );
    return val;
  });
}

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return $checkedNew('Weather', json, () {
    final val = Weather(
      location: $checkedConvert(json, 'location',
          (v) => Location.fromJson(v as Map<String, dynamic>)),
      temperature: $checkedConvert(json, 'temperature',
          (v) => Temperature.fromJson(v as Map<String, dynamic>)),
      timestamp: $checkedConvert(json, 'timestamp', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location.toJson(),
      'temperature': instance.temperature.toJson(),
      'timestamp': instance.timestamp,
    };
