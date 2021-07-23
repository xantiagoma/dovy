// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Line _$LineFromJson(Map<String, dynamic> json) {
  return _Line.fromJson(json);
}

/// @nodoc
class _$LineTearOff {
  const _$LineTearOff();

  _Line call(
      {int? id,
      String? color,
      String? name,
      String? code,
      String? shape,
      @JsonKey(fromJson: stationsFromJson) List<Station>? stations,
      LineDescription? description}) {
    return _Line(
      id: id,
      color: color,
      name: name,
      code: code,
      shape: shape,
      stations: stations,
      description: description,
    );
  }

  Line fromJson(Map<String, Object> json) {
    return Line.fromJson(json);
  }
}

/// @nodoc
const $Line = _$LineTearOff();

/// @nodoc
mixin _$Line {
  int? get id => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get shape => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stationsFromJson)
  List<Station>? get stations => throw _privateConstructorUsedError;
  LineDescription? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineCopyWith<Line> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineCopyWith<$Res> {
  factory $LineCopyWith(Line value, $Res Function(Line) then) =
      _$LineCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? color,
      String? name,
      String? code,
      String? shape,
      @JsonKey(fromJson: stationsFromJson) List<Station>? stations,
      LineDescription? description});

  $LineDescriptionCopyWith<$Res>? get description;
}

/// @nodoc
class _$LineCopyWithImpl<$Res> implements $LineCopyWith<$Res> {
  _$LineCopyWithImpl(this._value, this._then);

  final Line _value;
  // ignore: unused_field
  final $Res Function(Line) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? shape = freezed,
    Object? stations = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      shape: shape == freezed
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String?,
      stations: stations == freezed
          ? _value.stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<Station>?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LineDescription?,
    ));
  }

  @override
  $LineDescriptionCopyWith<$Res>? get description {
    if (_value.description == null) {
      return null;
    }

    return $LineDescriptionCopyWith<$Res>(_value.description!, (value) {
      return _then(_value.copyWith(description: value));
    });
  }
}

/// @nodoc
abstract class _$LineCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$LineCopyWith(_Line value, $Res Function(_Line) then) =
      __$LineCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? color,
      String? name,
      String? code,
      String? shape,
      @JsonKey(fromJson: stationsFromJson) List<Station>? stations,
      LineDescription? description});

  @override
  $LineDescriptionCopyWith<$Res>? get description;
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
    Object? id = freezed,
    Object? color = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? shape = freezed,
    Object? stations = freezed,
    Object? description = freezed,
  }) {
    return _then(_Line(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      shape: shape == freezed
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String?,
      stations: stations == freezed
          ? _value.stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<Station>?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LineDescription?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Line implements _Line {
  _$_Line(
      {this.id,
      this.color,
      this.name,
      this.code,
      this.shape,
      @JsonKey(fromJson: stationsFromJson) this.stations,
      this.description});

  factory _$_Line.fromJson(Map<String, dynamic> json) =>
      _$_$_LineFromJson(json);

  @override
  final int? id;
  @override
  final String? color;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? shape;
  @override
  @JsonKey(fromJson: stationsFromJson)
  final List<Station>? stations;
  @override
  final LineDescription? description;

  @override
  String toString() {
    return 'Line(id: $id, color: $color, name: $name, code: $code, shape: $shape, stations: $stations, description: $description)';
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
                    .equals(other.stations, stations)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(shape) ^
      const DeepCollectionEquality().hash(stations) ^
      const DeepCollectionEquality().hash(description);

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
      {int? id,
      String? color,
      String? name,
      String? code,
      String? shape,
      @JsonKey(fromJson: stationsFromJson) List<Station>? stations,
      LineDescription? description}) = _$_Line;

  factory _Line.fromJson(Map<String, dynamic> json) = _$_Line.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get color => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String? get shape => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: stationsFromJson)
  List<Station>? get stations => throw _privateConstructorUsedError;
  @override
  LineDescription? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LineCopyWith<_Line> get copyWith => throw _privateConstructorUsedError;
}

LineDescription _$LineDescriptionFromJson(Map<String, dynamic> json) {
  return _LineDescription.fromJson(json);
}

/// @nodoc
class _$LineDescriptionTearOff {
  const _$LineDescriptionTearOff();

  _LineDescription call({@JsonKey(name: 'Body') String? body}) {
    return _LineDescription(
      body: body,
    );
  }

  LineDescription fromJson(Map<String, Object> json) {
    return LineDescription.fromJson(json);
  }
}

/// @nodoc
const $LineDescription = _$LineDescriptionTearOff();

/// @nodoc
mixin _$LineDescription {
  @JsonKey(name: 'Body')
  String? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineDescriptionCopyWith<LineDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineDescriptionCopyWith<$Res> {
  factory $LineDescriptionCopyWith(
          LineDescription value, $Res Function(LineDescription) then) =
      _$LineDescriptionCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'Body') String? body});
}

/// @nodoc
class _$LineDescriptionCopyWithImpl<$Res>
    implements $LineDescriptionCopyWith<$Res> {
  _$LineDescriptionCopyWithImpl(this._value, this._then);

  final LineDescription _value;
  // ignore: unused_field
  final $Res Function(LineDescription) _then;

  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LineDescriptionCopyWith<$Res>
    implements $LineDescriptionCopyWith<$Res> {
  factory _$LineDescriptionCopyWith(
          _LineDescription value, $Res Function(_LineDescription) then) =
      __$LineDescriptionCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'Body') String? body});
}

/// @nodoc
class __$LineDescriptionCopyWithImpl<$Res>
    extends _$LineDescriptionCopyWithImpl<$Res>
    implements _$LineDescriptionCopyWith<$Res> {
  __$LineDescriptionCopyWithImpl(
      _LineDescription _value, $Res Function(_LineDescription) _then)
      : super(_value, (v) => _then(v as _LineDescription));

  @override
  _LineDescription get _value => super._value as _LineDescription;

  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_LineDescription(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LineDescription implements _LineDescription {
  _$_LineDescription({@JsonKey(name: 'Body') this.body});

  factory _$_LineDescription.fromJson(Map<String, dynamic> json) =>
      _$_$_LineDescriptionFromJson(json);

  @override
  @JsonKey(name: 'Body')
  final String? body;

  @override
  String toString() {
    return 'LineDescription(body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LineDescription &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(body);

  @JsonKey(ignore: true)
  @override
  _$LineDescriptionCopyWith<_LineDescription> get copyWith =>
      __$LineDescriptionCopyWithImpl<_LineDescription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LineDescriptionToJson(this);
  }
}

abstract class _LineDescription implements LineDescription {
  factory _LineDescription({@JsonKey(name: 'Body') String? body}) =
      _$_LineDescription;

  factory _LineDescription.fromJson(Map<String, dynamic> json) =
      _$_LineDescription.fromJson;

  @override
  @JsonKey(name: 'Body')
  String? get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LineDescriptionCopyWith<_LineDescription> get copyWith =>
      throw _privateConstructorUsedError;
}
