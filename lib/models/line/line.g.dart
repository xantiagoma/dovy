// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Line _$_$_LineFromJson(Map<String, dynamic> json) {
  return _$_Line(
    id: json['id'] as String,
    color: json['color'] as String,
    name: json['name'] as String,
    code: json['code'] as String,
    shape: json['shape'] as String,
    stations: stationsFromJson(json['stations']),
  );
}

Map<String, dynamic> _$_$_LineToJson(_$_Line instance) => <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'name': instance.name,
      'code': instance.code,
      'shape': instance.shape,
      'stations': instance.stations?.map((e) => e?.toJson())?.toList(),
    };
