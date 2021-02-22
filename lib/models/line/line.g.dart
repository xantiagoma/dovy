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
    description: json['description'] == null
        ? null
        : LineDescription.fromJson(json['description'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_LineToJson(_$_Line instance) => <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'name': instance.name,
      'code': instance.code,
      'shape': instance.shape,
      'stations': instance.stations?.map((e) => e?.toJson())?.toList(),
      'description': instance.description?.toJson(),
    };

_$_LineDescription _$_$_LineDescriptionFromJson(Map<String, dynamic> json) {
  return _$_LineDescription(
    body: json['Body'] as String,
  );
}

Map<String, dynamic> _$_$_LineDescriptionToJson(_$_LineDescription instance) =>
    <String, dynamic>{
      'Body': instance.body,
    };
