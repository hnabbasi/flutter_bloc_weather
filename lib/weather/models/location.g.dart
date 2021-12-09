// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return $checkedNew('Location', json, () {
    final val = Location(
      cityName: $checkedConvert(json, 'cityName', (v) => v as String),
      stateName: $checkedConvert(json, 'stateName', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'stateName': instance.stateName,
    };
