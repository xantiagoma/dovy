// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'address_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressDetails _$AddressDetailsFromJson(Map<String, dynamic> json) {
  return _AddressDetails.fromJson(json);
}

/// @nodoc
class _$AddressDetailsTearOff {
  const _$AddressDetailsTearOff();

  _AddressDetails call(
      {@JsonKey(name: 'place_id') required int? placeId,
      required String? licence,
      @JsonKey(name: 'osm_type') required String? osmType,
      @JsonKey(name: 'osm_id') required int? osmId,
      required String? lat,
      required String? lon,
      @JsonKey(name: 'place_rank') required int? placeRank,
      required String? category,
      required String? type,
      required double? importance,
      required String? addresstype,
      required String? name,
      @JsonKey(name: 'display_name') required String? displayName,
      required Address? address,
      required Map<String, dynamic>? extratags,
      required Namedetails? namedetails,
      required List<String>? boundingbox}) {
    return _AddressDetails(
      placeId: placeId,
      licence: licence,
      osmType: osmType,
      osmId: osmId,
      lat: lat,
      lon: lon,
      placeRank: placeRank,
      category: category,
      type: type,
      importance: importance,
      addresstype: addresstype,
      name: name,
      displayName: displayName,
      address: address,
      extratags: extratags,
      namedetails: namedetails,
      boundingbox: boundingbox,
    );
  }

  AddressDetails fromJson(Map<String, Object> json) {
    return AddressDetails.fromJson(json);
  }
}

/// @nodoc
const $AddressDetails = _$AddressDetailsTearOff();

/// @nodoc
mixin _$AddressDetails {
  @JsonKey(name: 'place_id')
  int? get placeId => throw _privateConstructorUsedError;
  String? get licence => throw _privateConstructorUsedError;
  @JsonKey(name: 'osm_type')
  String? get osmType => throw _privateConstructorUsedError;
  @JsonKey(name: 'osm_id')
  int? get osmId => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_rank')
  int? get placeRank => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  double? get importance => throw _privateConstructorUsedError;
  String? get addresstype => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extratags => throw _privateConstructorUsedError;
  Namedetails? get namedetails => throw _privateConstructorUsedError;
  List<String>? get boundingbox => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDetailsCopyWith<AddressDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDetailsCopyWith<$Res> {
  factory $AddressDetailsCopyWith(
          AddressDetails value, $Res Function(AddressDetails) then) =
      _$AddressDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'place_id') int? placeId,
      String? licence,
      @JsonKey(name: 'osm_type') String? osmType,
      @JsonKey(name: 'osm_id') int? osmId,
      String? lat,
      String? lon,
      @JsonKey(name: 'place_rank') int? placeRank,
      String? category,
      String? type,
      double? importance,
      String? addresstype,
      String? name,
      @JsonKey(name: 'display_name') String? displayName,
      Address? address,
      Map<String, dynamic>? extratags,
      Namedetails? namedetails,
      List<String>? boundingbox});

  $AddressCopyWith<$Res>? get address;
  $NamedetailsCopyWith<$Res>? get namedetails;
}

/// @nodoc
class _$AddressDetailsCopyWithImpl<$Res>
    implements $AddressDetailsCopyWith<$Res> {
  _$AddressDetailsCopyWithImpl(this._value, this._then);

  final AddressDetails _value;
  // ignore: unused_field
  final $Res Function(AddressDetails) _then;

  @override
  $Res call({
    Object? placeId = freezed,
    Object? licence = freezed,
    Object? osmType = freezed,
    Object? osmId = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? placeRank = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? importance = freezed,
    Object? addresstype = freezed,
    Object? name = freezed,
    Object? displayName = freezed,
    Object? address = freezed,
    Object? extratags = freezed,
    Object? namedetails = freezed,
    Object? boundingbox = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int?,
      licence: licence == freezed
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String?,
      osmType: osmType == freezed
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String?,
      osmId: osmId == freezed
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      placeRank: placeRank == freezed
          ? _value.placeRank
          : placeRank // ignore: cast_nullable_to_non_nullable
              as int?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double?,
      addresstype: addresstype == freezed
          ? _value.addresstype
          : addresstype // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      extratags: extratags == freezed
          ? _value.extratags
          : extratags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      namedetails: namedetails == freezed
          ? _value.namedetails
          : namedetails // ignore: cast_nullable_to_non_nullable
              as Namedetails?,
      boundingbox: boundingbox == freezed
          ? _value.boundingbox
          : boundingbox // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  @override
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value));
    });
  }

  @override
  $NamedetailsCopyWith<$Res>? get namedetails {
    if (_value.namedetails == null) {
      return null;
    }

    return $NamedetailsCopyWith<$Res>(_value.namedetails!, (value) {
      return _then(_value.copyWith(namedetails: value));
    });
  }
}

/// @nodoc
abstract class _$AddressDetailsCopyWith<$Res>
    implements $AddressDetailsCopyWith<$Res> {
  factory _$AddressDetailsCopyWith(
          _AddressDetails value, $Res Function(_AddressDetails) then) =
      __$AddressDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'place_id') int? placeId,
      String? licence,
      @JsonKey(name: 'osm_type') String? osmType,
      @JsonKey(name: 'osm_id') int? osmId,
      String? lat,
      String? lon,
      @JsonKey(name: 'place_rank') int? placeRank,
      String? category,
      String? type,
      double? importance,
      String? addresstype,
      String? name,
      @JsonKey(name: 'display_name') String? displayName,
      Address? address,
      Map<String, dynamic>? extratags,
      Namedetails? namedetails,
      List<String>? boundingbox});

  @override
  $AddressCopyWith<$Res>? get address;
  @override
  $NamedetailsCopyWith<$Res>? get namedetails;
}

/// @nodoc
class __$AddressDetailsCopyWithImpl<$Res>
    extends _$AddressDetailsCopyWithImpl<$Res>
    implements _$AddressDetailsCopyWith<$Res> {
  __$AddressDetailsCopyWithImpl(
      _AddressDetails _value, $Res Function(_AddressDetails) _then)
      : super(_value, (v) => _then(v as _AddressDetails));

  @override
  _AddressDetails get _value => super._value as _AddressDetails;

  @override
  $Res call({
    Object? placeId = freezed,
    Object? licence = freezed,
    Object? osmType = freezed,
    Object? osmId = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? placeRank = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? importance = freezed,
    Object? addresstype = freezed,
    Object? name = freezed,
    Object? displayName = freezed,
    Object? address = freezed,
    Object? extratags = freezed,
    Object? namedetails = freezed,
    Object? boundingbox = freezed,
  }) {
    return _then(_AddressDetails(
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int?,
      licence: licence == freezed
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String?,
      osmType: osmType == freezed
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String?,
      osmId: osmId == freezed
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      placeRank: placeRank == freezed
          ? _value.placeRank
          : placeRank // ignore: cast_nullable_to_non_nullable
              as int?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double?,
      addresstype: addresstype == freezed
          ? _value.addresstype
          : addresstype // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      extratags: extratags == freezed
          ? _value.extratags
          : extratags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      namedetails: namedetails == freezed
          ? _value.namedetails
          : namedetails // ignore: cast_nullable_to_non_nullable
              as Namedetails?,
      boundingbox: boundingbox == freezed
          ? _value.boundingbox
          : boundingbox // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressDetails implements _AddressDetails {
  _$_AddressDetails(
      {@JsonKey(name: 'place_id') required this.placeId,
      required this.licence,
      @JsonKey(name: 'osm_type') required this.osmType,
      @JsonKey(name: 'osm_id') required this.osmId,
      required this.lat,
      required this.lon,
      @JsonKey(name: 'place_rank') required this.placeRank,
      required this.category,
      required this.type,
      required this.importance,
      required this.addresstype,
      required this.name,
      @JsonKey(name: 'display_name') required this.displayName,
      required this.address,
      required this.extratags,
      required this.namedetails,
      required this.boundingbox});

  factory _$_AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressDetailsFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final int? placeId;
  @override
  final String? licence;
  @override
  @JsonKey(name: 'osm_type')
  final String? osmType;
  @override
  @JsonKey(name: 'osm_id')
  final int? osmId;
  @override
  final String? lat;
  @override
  final String? lon;
  @override
  @JsonKey(name: 'place_rank')
  final int? placeRank;
  @override
  final String? category;
  @override
  final String? type;
  @override
  final double? importance;
  @override
  final String? addresstype;
  @override
  final String? name;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  final Address? address;
  @override
  final Map<String, dynamic>? extratags;
  @override
  final Namedetails? namedetails;
  @override
  final List<String>? boundingbox;

  @override
  String toString() {
    return 'AddressDetails(placeId: $placeId, licence: $licence, osmType: $osmType, osmId: $osmId, lat: $lat, lon: $lon, placeRank: $placeRank, category: $category, type: $type, importance: $importance, addresstype: $addresstype, name: $name, displayName: $displayName, address: $address, extratags: $extratags, namedetails: $namedetails, boundingbox: $boundingbox)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddressDetails &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.licence, licence) ||
                const DeepCollectionEquality()
                    .equals(other.licence, licence)) &&
            (identical(other.osmType, osmType) ||
                const DeepCollectionEquality()
                    .equals(other.osmType, osmType)) &&
            (identical(other.osmId, osmId) ||
                const DeepCollectionEquality().equals(other.osmId, osmId)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)) &&
            (identical(other.placeRank, placeRank) ||
                const DeepCollectionEquality()
                    .equals(other.placeRank, placeRank)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.importance, importance) ||
                const DeepCollectionEquality()
                    .equals(other.importance, importance)) &&
            (identical(other.addresstype, addresstype) ||
                const DeepCollectionEquality()
                    .equals(other.addresstype, addresstype)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.extratags, extratags) ||
                const DeepCollectionEquality()
                    .equals(other.extratags, extratags)) &&
            (identical(other.namedetails, namedetails) ||
                const DeepCollectionEquality()
                    .equals(other.namedetails, namedetails)) &&
            (identical(other.boundingbox, boundingbox) ||
                const DeepCollectionEquality()
                    .equals(other.boundingbox, boundingbox)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(licence) ^
      const DeepCollectionEquality().hash(osmType) ^
      const DeepCollectionEquality().hash(osmId) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(placeRank) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(importance) ^
      const DeepCollectionEquality().hash(addresstype) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(extratags) ^
      const DeepCollectionEquality().hash(namedetails) ^
      const DeepCollectionEquality().hash(boundingbox);

  @JsonKey(ignore: true)
  @override
  _$AddressDetailsCopyWith<_AddressDetails> get copyWith =>
      __$AddressDetailsCopyWithImpl<_AddressDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressDetailsToJson(this);
  }
}

abstract class _AddressDetails implements AddressDetails {
  factory _AddressDetails(
      {@JsonKey(name: 'place_id') required int? placeId,
      required String? licence,
      @JsonKey(name: 'osm_type') required String? osmType,
      @JsonKey(name: 'osm_id') required int? osmId,
      required String? lat,
      required String? lon,
      @JsonKey(name: 'place_rank') required int? placeRank,
      required String? category,
      required String? type,
      required double? importance,
      required String? addresstype,
      required String? name,
      @JsonKey(name: 'display_name') required String? displayName,
      required Address? address,
      required Map<String, dynamic>? extratags,
      required Namedetails? namedetails,
      required List<String>? boundingbox}) = _$_AddressDetails;

  factory _AddressDetails.fromJson(Map<String, dynamic> json) =
      _$_AddressDetails.fromJson;

  @override
  @JsonKey(name: 'place_id')
  int? get placeId => throw _privateConstructorUsedError;
  @override
  String? get licence => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'osm_type')
  String? get osmType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'osm_id')
  int? get osmId => throw _privateConstructorUsedError;
  @override
  String? get lat => throw _privateConstructorUsedError;
  @override
  String? get lon => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'place_rank')
  int? get placeRank => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  double? get importance => throw _privateConstructorUsedError;
  @override
  String? get addresstype => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @override
  Address? get address => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get extratags => throw _privateConstructorUsedError;
  @override
  Namedetails? get namedetails => throw _privateConstructorUsedError;
  @override
  List<String>? get boundingbox => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressDetailsCopyWith<_AddressDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
class _$AddressTearOff {
  const _$AddressTearOff();

  _Address call(
      {String? neighbourhood,
      String? suburb,
      @JsonKey(name: 'city_district') String? cityDistrict,
      String? city,
      @JsonKey(name: 'state_district') String? stateDistrict,
      String? state,
      String? region,
      String? postcode,
      String? country,
      @JsonKey(name: 'country_code') String? countryCode}) {
    return _Address(
      neighbourhood: neighbourhood,
      suburb: suburb,
      cityDistrict: cityDistrict,
      city: city,
      stateDistrict: stateDistrict,
      state: state,
      region: region,
      postcode: postcode,
      country: country,
      countryCode: countryCode,
    );
  }

  Address fromJson(Map<String, Object> json) {
    return Address.fromJson(json);
  }
}

/// @nodoc
const $Address = _$AddressTearOff();

/// @nodoc
mixin _$Address {
  String? get neighbourhood => throw _privateConstructorUsedError;
  String? get suburb => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_district')
  String? get cityDistrict => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_district')
  String? get stateDistrict => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  String? get countryCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {String? neighbourhood,
      String? suburb,
      @JsonKey(name: 'city_district') String? cityDistrict,
      String? city,
      @JsonKey(name: 'state_district') String? stateDistrict,
      String? state,
      String? region,
      String? postcode,
      String? country,
      @JsonKey(name: 'country_code') String? countryCode});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? neighbourhood = freezed,
    Object? suburb = freezed,
    Object? cityDistrict = freezed,
    Object? city = freezed,
    Object? stateDistrict = freezed,
    Object? state = freezed,
    Object? region = freezed,
    Object? postcode = freezed,
    Object? country = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      neighbourhood: neighbourhood == freezed
          ? _value.neighbourhood
          : neighbourhood // ignore: cast_nullable_to_non_nullable
              as String?,
      suburb: suburb == freezed
          ? _value.suburb
          : suburb // ignore: cast_nullable_to_non_nullable
              as String?,
      cityDistrict: cityDistrict == freezed
          ? _value.cityDistrict
          : cityDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      stateDistrict: stateDistrict == freezed
          ? _value.stateDistrict
          : stateDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: postcode == freezed
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) then) =
      __$AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? neighbourhood,
      String? suburb,
      @JsonKey(name: 'city_district') String? cityDistrict,
      String? city,
      @JsonKey(name: 'state_district') String? stateDistrict,
      String? state,
      String? region,
      String? postcode,
      String? country,
      @JsonKey(name: 'country_code') String? countryCode});
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(_Address _value, $Res Function(_Address) _then)
      : super(_value, (v) => _then(v as _Address));

  @override
  _Address get _value => super._value as _Address;

  @override
  $Res call({
    Object? neighbourhood = freezed,
    Object? suburb = freezed,
    Object? cityDistrict = freezed,
    Object? city = freezed,
    Object? stateDistrict = freezed,
    Object? state = freezed,
    Object? region = freezed,
    Object? postcode = freezed,
    Object? country = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_Address(
      neighbourhood: neighbourhood == freezed
          ? _value.neighbourhood
          : neighbourhood // ignore: cast_nullable_to_non_nullable
              as String?,
      suburb: suburb == freezed
          ? _value.suburb
          : suburb // ignore: cast_nullable_to_non_nullable
              as String?,
      cityDistrict: cityDistrict == freezed
          ? _value.cityDistrict
          : cityDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      stateDistrict: stateDistrict == freezed
          ? _value.stateDistrict
          : stateDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: postcode == freezed
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {this.neighbourhood,
      this.suburb,
      @JsonKey(name: 'city_district') this.cityDistrict,
      this.city,
      @JsonKey(name: 'state_district') this.stateDistrict,
      this.state,
      this.region,
      this.postcode,
      this.country,
      @JsonKey(name: 'country_code') this.countryCode});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFromJson(json);

  @override
  final String? neighbourhood;
  @override
  final String? suburb;
  @override
  @JsonKey(name: 'city_district')
  final String? cityDistrict;
  @override
  final String? city;
  @override
  @JsonKey(name: 'state_district')
  final String? stateDistrict;
  @override
  final String? state;
  @override
  final String? region;
  @override
  final String? postcode;
  @override
  final String? country;
  @override
  @JsonKey(name: 'country_code')
  final String? countryCode;

  @override
  String toString() {
    return 'Address(neighbourhood: $neighbourhood, suburb: $suburb, cityDistrict: $cityDistrict, city: $city, stateDistrict: $stateDistrict, state: $state, region: $region, postcode: $postcode, country: $country, countryCode: $countryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Address &&
            (identical(other.neighbourhood, neighbourhood) ||
                const DeepCollectionEquality()
                    .equals(other.neighbourhood, neighbourhood)) &&
            (identical(other.suburb, suburb) ||
                const DeepCollectionEquality().equals(other.suburb, suburb)) &&
            (identical(other.cityDistrict, cityDistrict) ||
                const DeepCollectionEquality()
                    .equals(other.cityDistrict, cityDistrict)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.stateDistrict, stateDistrict) ||
                const DeepCollectionEquality()
                    .equals(other.stateDistrict, stateDistrict)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.region, region) ||
                const DeepCollectionEquality().equals(other.region, region)) &&
            (identical(other.postcode, postcode) ||
                const DeepCollectionEquality()
                    .equals(other.postcode, postcode)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(neighbourhood) ^
      const DeepCollectionEquality().hash(suburb) ^
      const DeepCollectionEquality().hash(cityDistrict) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(stateDistrict) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(region) ^
      const DeepCollectionEquality().hash(postcode) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(countryCode);

  @JsonKey(ignore: true)
  @override
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  factory _Address(
      {String? neighbourhood,
      String? suburb,
      @JsonKey(name: 'city_district') String? cityDistrict,
      String? city,
      @JsonKey(name: 'state_district') String? stateDistrict,
      String? state,
      String? region,
      String? postcode,
      String? country,
      @JsonKey(name: 'country_code') String? countryCode}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String? get neighbourhood => throw _privateConstructorUsedError;
  @override
  String? get suburb => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'city_district')
  String? get cityDistrict => throw _privateConstructorUsedError;
  @override
  String? get city => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'state_district')
  String? get stateDistrict => throw _privateConstructorUsedError;
  @override
  String? get state => throw _privateConstructorUsedError;
  @override
  String? get region => throw _privateConstructorUsedError;
  @override
  String? get postcode => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'country_code')
  String? get countryCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressCopyWith<_Address> get copyWith =>
      throw _privateConstructorUsedError;
}

Namedetails _$NamedetailsFromJson(Map<String, dynamic> json) {
  return _Namedetails.fromJson(json);
}

/// @nodoc
class _$NamedetailsTearOff {
  const _$NamedetailsTearOff();

  _Namedetails call({String? name}) {
    return _Namedetails(
      name: name,
    );
  }

  Namedetails fromJson(Map<String, Object> json) {
    return Namedetails.fromJson(json);
  }
}

/// @nodoc
const $Namedetails = _$NamedetailsTearOff();

/// @nodoc
mixin _$Namedetails {
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NamedetailsCopyWith<Namedetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamedetailsCopyWith<$Res> {
  factory $NamedetailsCopyWith(
          Namedetails value, $Res Function(Namedetails) then) =
      _$NamedetailsCopyWithImpl<$Res>;
  $Res call({String? name});
}

/// @nodoc
class _$NamedetailsCopyWithImpl<$Res> implements $NamedetailsCopyWith<$Res> {
  _$NamedetailsCopyWithImpl(this._value, this._then);

  final Namedetails _value;
  // ignore: unused_field
  final $Res Function(Namedetails) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NamedetailsCopyWith<$Res>
    implements $NamedetailsCopyWith<$Res> {
  factory _$NamedetailsCopyWith(
          _Namedetails value, $Res Function(_Namedetails) then) =
      __$NamedetailsCopyWithImpl<$Res>;
  @override
  $Res call({String? name});
}

/// @nodoc
class __$NamedetailsCopyWithImpl<$Res> extends _$NamedetailsCopyWithImpl<$Res>
    implements _$NamedetailsCopyWith<$Res> {
  __$NamedetailsCopyWithImpl(
      _Namedetails _value, $Res Function(_Namedetails) _then)
      : super(_value, (v) => _then(v as _Namedetails));

  @override
  _Namedetails get _value => super._value as _Namedetails;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_Namedetails(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Namedetails implements _Namedetails {
  _$_Namedetails({this.name});

  factory _$_Namedetails.fromJson(Map<String, dynamic> json) =>
      _$_$_NamedetailsFromJson(json);

  @override
  final String? name;

  @override
  String toString() {
    return 'Namedetails(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Namedetails &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$NamedetailsCopyWith<_Namedetails> get copyWith =>
      __$NamedetailsCopyWithImpl<_Namedetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NamedetailsToJson(this);
  }
}

abstract class _Namedetails implements Namedetails {
  factory _Namedetails({String? name}) = _$_Namedetails;

  factory _Namedetails.fromJson(Map<String, dynamic> json) =
      _$_Namedetails.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NamedetailsCopyWith<_Namedetails> get copyWith =>
      throw _privateConstructorUsedError;
}
