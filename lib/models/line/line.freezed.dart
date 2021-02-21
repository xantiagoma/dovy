// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Line _$LineFromJson(Map<String, dynamic> json) {
  return _Line.fromJson(json);
}

/// @nodoc
class _$LineTearOff {
  const _$LineTearOff();

// ignore: unused_element
  _Line call(
      {String id,
      String color,
      String name,
      String code,
      String shape,
      @JsonKey(fromJson: stationsFromJson) List<Station> stations}) {
    return _Line(
      id: id,
      color: color,
      name: name,
      code: code,
      shape: shape,
      stations: stations,
    );
  }

// ignore: unused_element
  Line fromJson(Map<String, Object> json) {
    return Line.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Line = _$LineTearOff();

/// @nodoc
mixin _$Line {
  String get id;
  String get color;
  String get name;
  String get code;
  String get shape;
  @JsonKey(fromJson: stationsFromJson)
  List<Station> get stations;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $LineCopyWith<Line> get copyWith;
}

/// @nodoc
abstract class $LineCopyWith<$Res> {
  factory $LineCopyWith(Line value, $Res Function(Line) then) =
      _$LineCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String color,
      String name,
      String code,
      String shape,
      @JsonKey(fromJson: stationsFromJson) List<Station> stations});
}

/// @nodoc
class _$LineCopyWithImpl<$Res> implements $LineCopyWith<$Res> {
  _$LineCopyWithImpl(this._value, this._then);

  final Line _value;
  // ignore: unused_field
  final $Res Function(Line) _then;

  @override
  $Res call({
    Object id = freezed,
    Object color = freezed,
    Object name = freezed,
    Object code = freezed,
    Object shape = freezed,
    Object stations = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      color: color == freezed ? _value.color : color as String,
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      shape: shape == freezed ? _value.shape : shape as String,
      stations:
          stations == freezed ? _value.stations : stations as List<Station>,
    ));
  }
}

/// @nodoc
abstract class _$LineCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$LineCopyWith(_Line value, $Res Function(_Line) then) =
      __$LineCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String color,
      String name,
      String code,
      String shape,
      @JsonKey(fromJson: stationsFromJson) List<Station> stations});
}

/// @nodoc
class __$LineCopyWithImpl<$Res> extends _$LineCopyWithImpl<$Res>
    implements _$LineCopyWith<$Res> {
  __$LineCopyWithImpl(_Line _value, $Res Function(_Line) _then)
      : super(_value, (v) => _then(v as _Line));

  @override
  _Line get _value => super._value as _Line;

  @override
  $Res call({
    Object id = freezed,
    Object color = freezed,
    Object name = freezed,
    Object code = freezed,
    Object shape = freezed,
    Object stations = freezed,
  }) {
    return _then(_Line(
      id: id == freezed ? _value.id : id as String,
      color: color == freezed ? _value.color : color as String,
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      shape: shape == freezed ? _value.shape : shape as String,
      stations:
          stations == freezed ? _value.stations : stations as List<Station>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Line implements _Line {
  _$_Line(
      {this.id,
      this.color,
      this.name,
      this.code,
      this.shape,
      @JsonKey(fromJson: stationsFromJson) this.stations});

  factory _$_Line.fromJson(Map<String, dynamic> json) =>
      _$_$_LineFromJson(json);

  @override
  final String id;
  @override
  final String color;
  @override
  final String name;
  @override
  final String code;
  @override
  final String shape;
  @override
  @JsonKey(fromJson: stationsFromJson)
  final List<Station> stations;

  @override
  String toString() {
    return 'Line(id: $id, color: $color, name: $name, code: $code, shape: $shape, stations: $stations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Line &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.shape, shape) ||
                const DeepCollectionEquality().equals(other.shape, shape)) &&
            (identical(other.stations, stations) ||
                const DeepCollectionEquality()
                    .equals(other.stations, stations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(shape) ^
      const DeepCollectionEquality().hash(stations);

  @JsonKey(ignore: true)
  @override
  _$LineCopyWith<_Line> get copyWith =>
      __$LineCopyWithImpl<_Line>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LineToJson(this);
  }
}

abstract class _Line implements Line {
  factory _Line(
      {String id,
      String color,
      String name,
      String code,
      String shape,
      @JsonKey(fromJson: stationsFromJson) List<Station> stations}) = _$_Line;

  factory _Line.fromJson(Map<String, dynamic> json) = _$_Line.fromJson;

  @override
  String get id;
  @override
  String get color;
  @override
  String get name;
  @override
  String get code;
  @override
  String get shape;
  @override
  @JsonKey(fromJson: stationsFromJson)
  List<Station> get stations;
  @override
  @JsonKey(ignore: true)
  _$LineCopyWith<_Line> get copyWith;
}
