// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Station _$StationFromJson(Map<String, dynamic> json) {
  return _Station.fromJson(json);
}

/// @nodoc
class _$StationTearOff {
  const _$StationTearOff();

  _Station call(
      {int? id,
      String? name,
      String? code,
      @JsonKey(fromJson: linesFromJson)
          List<Line>? lines,
      @JsonKey(fromJson: locationFromJson, toJson: locationToJson)
          LatLng? location}) {
    return _Station(
      id: id,
      name: name,
      code: code,
      lines: lines,
      location: location,
    );
  }

  Station fromJson(Map<String, Object> json) {
    return Station.fromJson(json);
  }
}

/// @nodoc
const $Station = _$StationTearOff();

/// @nodoc
mixin _$Station {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(fromJson: linesFromJson)
  List<Line>? get lines => throw _privateConstructorUsedError;
  @JsonKey(fromJson: locationFromJson, toJson: locationToJson)
  LatLng? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationCopyWith<Station> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationCopyWith<$Res> {
  factory $StationCopyWith(Station value, $Res Function(Station) then) =
      _$StationCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? code,
      @JsonKey(fromJson: linesFromJson)
          List<Line>? lines,
      @JsonKey(fromJson: locationFromJson, toJson: locationToJson)
          LatLng? location});
}

/// @nodoc
class _$StationCopyWithImpl<$Res> implements $StationCopyWith<$Res> {
  _$StationCopyWithImpl(this._value, this._then);

  final Station _value;
  // ignore: unused_field
  final $Res Function(Station) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? lines = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      lines: lines == freezed
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc
abstract class _$StationCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$StationCopyWith(_Station value, $Res Function(_Station) then) =
      __$StationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? code,
      @JsonKey(fromJson: linesFromJson)
          List<Line>? lines,
      @JsonKey(fromJson: locationFromJson, toJson: locationToJson)
          LatLng? location});
}

/// @nodoc
class __$StationCopyWithImpl<$Res> extends _$StationCopyWithImpl<$Res>
    implements _$StationCopyWith<$Res> {
  __$StationCopyWithImpl(_Station _value, $Res Function(_Station) _then)
      : super(_value, (v) => _then(v as _Station));

  @override
  _Station get _value => super._value as _Station;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? lines = freezed,
    Object? location = freezed,
  }) {
    return _then(_Station(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      lines: lines == freezed
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Station implements _Station {
  _$_Station(
      {this.id,
      this.name,
      this.code,
      @JsonKey(fromJson: linesFromJson)
          this.lines,
      @JsonKey(fromJson: locationFromJson, toJson: locationToJson)
          this.location});

  factory _$_Station.fromJson(Map<String, dynamic> json) =>
      _$_$_StationFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? code;
  @override
  @JsonKey(fromJson: linesFromJson)
  final List<Line>? lines;
  @override
  @JsonKey(fromJson: locationFromJson, toJson: locationToJson)
  final LatLng? location;

  @override
  String toString() {
    return 'Station(id: $id, name: $name, code: $code, lines: $lines, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Station &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.lines, lines) ||
                const DeepCollectionEquality().equals(other.lines, lines)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(lines) ^
      const DeepCollectionEquality().hash(location);

  @JsonKey(ignore: true)
  @override
  _$StationCopyWith<_Station> get copyWith =>
      __$StationCopyWithImpl<_Station>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StationToJson(this);
  }
}

abstract class _Station implements Station {
  factory _Station(
      {int? id,
      String? name,
      String? code,
      @JsonKey(fromJson: linesFromJson)
          List<Line>? lines,
      @JsonKey(fromJson: locationFromJson, toJson: locationToJson)
          LatLng? location}) = _$_Station;

  factory _Station.fromJson(Map<String, dynamic> json) = _$_Station.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: linesFromJson)
  List<Line>? get lines => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: locationFromJson, toJson: locationToJson)
  LatLng? get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StationCopyWith<_Station> get copyWith =>
      throw _privateConstructorUsedError;
}
