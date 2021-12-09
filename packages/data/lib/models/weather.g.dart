// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of data;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return $checkedNew('Weather', json, () {
    final val = Weather(
      id: $checkedConvert(json, '@id', (v) => v as String),
      type: $checkedConvert(json, '@type', (v) => v as String),
      location: $checkedConvert(json, 'location',
          (v) => Location.fromJson(v as Map<String, dynamic>)),
      station: $checkedConvert(json, 'station', (v) => v as String),
      timestamp: $checkedConvert(json, 'timestamp', (v) => v as String),
      rawMessage: $checkedConvert(json, 'rawMessage', (v) => v as String),
      textDescription:
          $checkedConvert(json, 'textDescription', (v) => v as String),
      icon: $checkedConvert(json, 'icon', (v) => v as String),
      temperature: $checkedConvert(json, 'temperature',
          (v) => UnitCodeValue.fromJson(v as Map<String, dynamic>)),
      dewpoint: $checkedConvert(json, 'dewpoint',
          (v) => UnitCodeValue.fromJson(v as Map<String, dynamic>)),
      windDirection: $checkedConvert(json, 'windDirection',
          (v) => UnitCodeValue.fromJson(v as Map<String, dynamic>)),
      windSpeed: $checkedConvert(json, 'windSpeed',
          (v) => UnitCodeValue.fromJson(v as Map<String, dynamic>)),
      visibility: $checkedConvert(json, 'visibility',
          (v) => UnitCodeValue.fromJson(v as Map<String, dynamic>)),
      relativeHumidity: $checkedConvert(json, 'relativeHumidity',
          (v) => UnitCodeValue.fromJson(v as Map<String, dynamic>)),
      windChill: $checkedConvert(json, 'windChill',
          (v) => UnitCodeValue.fromJson(v as Map<String, dynamic>)),
      heatIndex: $checkedConvert(json, 'heatIndex',
          (v) => UnitCodeValue.fromJson(v as Map<String, dynamic>)),
    );
    return val;
  }, fieldKeyMap: const {'id': '@id', 'type': '@type'});
}

UnitCodeValue _$UnitCodeValueFromJson(Map<String, dynamic> json) {
  return $checkedNew('UnitCodeValue', json, () {
    final val = UnitCodeValue(
      unitCode: $checkedConvert(json, 'unitCode', (v) => v as String),
      value: $checkedConvert(json, 'value', (v) => (v as num?)?.toDouble()),
      qualityControl:
          $checkedConvert(json, 'qualityControl', (v) => v as String),
    );
    return val;
  });
}
