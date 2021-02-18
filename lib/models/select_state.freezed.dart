// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SelectStateTearOff {
  const _$SelectStateTearOff();

// ignore: unused_element
  _SelectState call(
      {@nullable String system,
      @nullable String line,
      @nullable String station}) {
    return _SelectState(
      system: system,
      line: line,
      station: station,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SelectState = _$SelectStateTearOff();

/// @nodoc
mixin _$SelectState {
  @nullable
  String get system;
  @nullable
  String get line;
  @nullable
  String get station;

  @JsonKey(ignore: true)
  $SelectStateCopyWith<SelectState> get copyWith;
}

/// @nodoc
abstract class $SelectStateCopyWith<$Res> {
  factory $SelectStateCopyWith(
          SelectState value, $Res Function(SelectState) then) =
      _$SelectStateCopyWithImpl<$Res>;
  $Res call(
      {@nullable String system,
      @nullable String line,
      @nullable String station});
}

/// @nodoc
class _$SelectStateCopyWithImpl<$Res> implements $SelectStateCopyWith<$Res> {
  _$SelectStateCopyWithImpl(this._value, this._then);

  final SelectState _value;
  // ignore: unused_field
  final $Res Function(SelectState) _then;

  @override
  $Res call({
    Object system = freezed,
    Object line = freezed,
    Object station = freezed,
  }) {
    return _then(_value.copyWith(
      system: system == freezed ? _value.system : system as String,
      line: line == freezed ? _value.line : line as String,
      station: station == freezed ? _value.station : station as String,
    ));
  }
}

/// @nodoc
abstract class _$SelectStateCopyWith<$Res>
    implements $SelectStateCopyWith<$Res> {
  factory _$SelectStateCopyWith(
          _SelectState value, $Res Function(_SelectState) then) =
      __$SelectStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String system,
      @nullable String line,
      @nullable String station});
}

/// @nodoc
class __$SelectStateCopyWithImpl<$Res> extends _$SelectStateCopyWithImpl<$Res>
    implements _$SelectStateCopyWith<$Res> {
  __$SelectStateCopyWithImpl(
      _SelectState _value, $Res Function(_SelectState) _then)
      : super(_value, (v) => _then(v as _SelectState));

  @override
  _SelectState get _value => super._value as _SelectState;

  @override
  $Res call({
    Object system = freezed,
    Object line = freezed,
    Object station = freezed,
  }) {
    return _then(_SelectState(
      system: system == freezed ? _value.system : system as String,
      line: line == freezed ? _value.line : line as String,
      station: station == freezed ? _value.station : station as String,
    ));
  }
}

/// @nodoc
class _$_SelectState implements _SelectState {
  _$_SelectState(
      {@nullable this.system, @nullable this.line, @nullable this.station});

  @override
  @nullable
  final String system;
  @override
  @nullable
  final String line;
  @override
  @nullable
  final String station;

  @override
  String toString() {
    return 'SelectState(system: $system, line: $line, station: $station)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectState &&
            (identical(other.system, system) ||
                const DeepCollectionEquality().equals(other.system, system)) &&
            (identical(other.line, line) ||
                const DeepCollectionEquality().equals(other.line, line)) &&
            (identical(other.station, station) ||
                const DeepCollectionEquality().equals(other.station, station)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(system) ^
      const DeepCollectionEquality().hash(line) ^
      const DeepCollectionEquality().hash(station);

  @JsonKey(ignore: true)
  @override
  _$SelectStateCopyWith<_SelectState> get copyWith =>
      __$SelectStateCopyWithImpl<_SelectState>(this, _$identity);
}

abstract class _SelectState implements SelectState {
  factory _SelectState(
      {@nullable String system,
      @nullable String line,
      @nullable String station}) = _$_SelectState;

  @override
  @nullable
  String get system;
  @override
  @nullable
  String get line;
  @override
  @nullable
  String get station;
  @override
  @JsonKey(ignore: true)
  _$SelectStateCopyWith<_SelectState> get copyWith;
}
