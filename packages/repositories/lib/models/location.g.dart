// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return $checkedNew('Location', json, () {
    final val = Location(
      cityName: $checkedConvert(json, 'city', (v) => v as String),
      stateName: $checkedConvert(json, 'state', (v) => v as String),
      lat: $checkedConvert(json, 'lat', (v) => (v as num).toDouble()),
      long: $checkedConvert(json, 'long', (v) => (v as num).toDouble()),
      cwa: $checkedConvert(json, 'cwa', (v) => v as String),
      gridX: $checkedConvert(json, 'gridX', (v) => v as int),
      gridY: $checkedConvert(json, 'gridY', (v) => v as int),
      forecastUrl: $checkedConvert(json, 'forecast', (v) => v as String),
      hourlyForecastUrl:
          $checkedConvert(json, 'forecastHourly', (v) => v as String),
      observationStations:
          $checkedConvert(json, 'observationStations', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'cityName': 'city',
    'stateName': 'state',
    'forecastUrl': 'forecast',
    'hourlyForecastUrl': 'forecastHourly'
  });
}
