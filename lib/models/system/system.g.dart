// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_System _$_$_SystemFromJson(Map<String, dynamic> json) {
  return _$_System(
    id: json['id'] as String?,
    name: json['name'] as String?,
    code: json['code'] as String?,
    lines: (json['lines'] as List<dynamic>?)
        ?.map((e) => Line.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SystemToJson(_$_System instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'lines': instance.lines?.map((e) => e.toJson()).toList(),
    };
