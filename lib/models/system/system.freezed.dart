// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'system.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
System _$SystemFromJson(Map<String, dynamic> json) {
  return _System.fromJson(json);
}

/// @nodoc
class _$SystemTearOff {
  const _$SystemTearOff();

// ignore: unused_element
  _System call({String id, String name, String code, List<Line> lines}) {
    return _System(
      id: id,
      name: name,
      code: code,
      lines: lines,
    );
  }

// ignore: unused_element
  System fromJson(Map<String, Object> json) {
    return System.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $System = _$SystemTearOff();

/// @nodoc
mixin _$System {
  String get id;
  String get name;
  String get code;
  List<Line> get lines;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SystemCopyWith<System> get copyWith;
}

/// @nodoc
abstract class $SystemCopyWith<$Res> {
  factory $SystemCopyWith(System value, $Res Function(System) then) =
      _$SystemCopyWithImpl<$Res>;
  $Res call({String id, String name, String code, List<Line> lines});
}

/// @nodoc
class _$SystemCopyWithImpl<$Res> implements $SystemCopyWith<$Res> {
  _$SystemCopyWithImpl(this._value, this._then);

  final System _value;
  // ignore: unused_field
  final $Res Function(System) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object code = freezed,
    Object lines = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      lines: lines == freezed ? _value.lines : lines as List<Line>,
    ));
  }
}

/// @nodoc
abstract class _$SystemCopyWith<$Res> implements $SystemCopyWith<$Res> {
  factory _$SystemCopyWith(_System value, $Res Function(_System) then) =
      __$SystemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String code, List<Line> lines});
}

/// @nodoc
class __$SystemCopyWithImpl<$Res> extends _$SystemCopyWithImpl<$Res>
    implements _$SystemCopyWith<$Res> {
  __$SystemCopyWithImpl(_System _value, $Res Function(_System) _then)
      : super(_value, (v) => _then(v as _System));

  @override
  _System get _value => super._value as _System;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object code = freezed,
    Object lines = freezed,
  }) {
    return _then(_System(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      lines: lines == freezed ? _value.lines : lines as List<Line>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_System implements _System {
  _$_System({this.id, this.name, this.code, this.lines});

  factory _$_System.fromJson(Map<String, dynamic> json) =>
      _$_$_SystemFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;
  @override
  final List<Line> lines;

  @override
  String toString() {
    return 'System(id: $id, name: $name, code: $code, lines: $lines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _System &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.lines, lines) ||
                const DeepCollectionEquality().equals(other.lines, lines)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(lines);

  @JsonKey(ignore: true)
  @override
  _$SystemCopyWith<_System> get copyWith =>
      __$SystemCopyWithImpl<_System>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SystemToJson(this);
  }
}

abstract class _System implements System {
  factory _System({String id, String name, String code, List<Line> lines}) =
      _$_System;

  factory _System.fromJson(Map<String, dynamic> json) = _$_System.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;
  @override
  List<Line> get lines;
  @override
  @JsonKey(ignore: true)
  _$SystemCopyWith<_System> get copyWith;
}
