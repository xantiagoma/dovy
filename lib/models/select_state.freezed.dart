// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SelectStateTearOff {
  const _$SelectStateTearOff();

  _SelectState call({String? system, String? line, String? station}) {
    return _SelectState(
      system: system,
      line: line,
      station: station,
    );
  }
}

/// @nodoc
const $SelectState = _$SelectStateTearOff();

/// @nodoc
mixin _$SelectState {
  String? get system => throw _privateConstructorUsedError;
  String? get line => throw _privateConstructorUsedError;
  String? get station => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectStateCopyWith<SelectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectStateCopyWith<$Res> {
  factory $SelectStateCopyWith(
          SelectState value, $Res Function(SelectState) then) =
      _$SelectStateCopyWithImpl<$Res>;
  $Res call({String? system, String? line, String? station});
}

/// @nodoc
class _$SelectStateCopyWithImpl<$Res> implements $SelectStateCopyWith<$Res> {
  _$SelectStateCopyWithImpl(this._value, this._then);

  final SelectState _value;
  // ignore: unused_field
  final $Res Function(SelectState) _then;

  @override
  $Res call({
    Object? system = freezed,
    Object? line = freezed,
    Object? station = freezed,
  }) {
    return _then(_value.copyWith(
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      station: station == freezed
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? system, String? line, String? station});
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
    Object? system = freezed,
    Object? line = freezed,
    Object? station = freezed,
  }) {
    return _then(_SelectState(
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      station: station == freezed
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SelectState implements _SelectState {
  _$_SelectState({this.system, this.line, this.station});

  @override
  final String? system;
  @override
  final String? line;
  @override
  final String? station;

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
  factory _SelectState({String? system, String? line, String? station}) =
      _$_SelectState;

  @override
  String? get system => throw _privateConstructorUsedError;
  @override
  String? get line => throw _privateConstructorUsedError;
  @override
  String? get station => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SelectStateCopyWith<_SelectState> get copyWith =>
      throw _privateConstructorUsedError;
}
