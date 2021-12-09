// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of repositories;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return $checkedNew('Weather', json, () {
    final val = Weather(
      location: $checkedConvert(json, 'location',
          (v) => Location.fromJson(v as Map<String, dynamic>)),
      timestamp: $checkedConvert(json, 'timestamp', (v) => v as String),
      textDescription:
          $checkedConvert(json, 'textDescription', (v) => v as String),
      icon: $checkedConvert(json, 'icon', (v) => v as String),
      temperature: $checkedConvert(json, 'temperature',
          (v) => UnitValue.fromJson(v as Map<String, dynamic>)),
      dewPoint: $checkedConvert(json, 'dewPoint',
          (v) => UnitValue.fromJson(v as Map<String, dynamic>)),
      windDirection: $checkedConvert(json, 'windDirection',
          (v) => UnitValue.fromJson(v as Map<String, dynamic>)),
      windSpeed: $checkedConvert(json, 'windSpeed',
          (v) => UnitValue.fromJson(v as Map<String, dynamic>)),
      visibility: $checkedConvert(json, 'visibility',
          (v) => UnitValue.fromJson(v as Map<String, dynamic>)),
      relativeHumidity: $checkedConvert(json, 'relativeHumidity',
          (v) => UnitValue.fromJson(v as Map<String, dynamic>)),
      windChill: $checkedConvert(json, 'windChill',
          (v) => UnitValue.fromJson(v as Map<String, dynamic>)),
      heatIndex: $checkedConvert(json, 'heatIndex',
          (v) => UnitValue.fromJson(v as Map<String, dynamic>)),
    );
    return val;
  });
}

UnitValue _$UnitValueFromJson(Map<String, dynamic> json) {
  return $checkedNew('UnitValue', json, () {
    final val = UnitValue(
      unit: $checkedConvert(json, 'unit', (v) => v as String),
      value: $checkedConvert(json, 'value', (v) => (v as num).toDouble()),
    );
    return val;
  });
}
