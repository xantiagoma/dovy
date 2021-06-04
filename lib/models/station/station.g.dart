// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Station _$_$_StationFromJson(Map<String, dynamic> json) {
  return _$_Station(
    id: json['id'] as String?,
    name: json['name'] as String?,
    code: json['code'] as String?,
    lines: linesFromJson(json['lines'] as List?),
    location: locationFromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StationToJson(_$_Station instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'lines': instance.lines?.map((e) => e.toJson()).toList(),
      'location': locationToJson(instance.location),
    };
