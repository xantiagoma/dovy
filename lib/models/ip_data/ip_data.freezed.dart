// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ip_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IPData _$IPDataFromJson(Map<String, dynamic> json) {
  return _IPData.fromJson(json);
}

/// @nodoc
class _$IPDataTearOff {
  const _$IPDataTearOff();

  _IPData call(
      {String? ip,
      String? version,
      String? city,
      String? region,
      @JsonKey(name: 'region_code') String? regionCode,
      String? country,
      @JsonKey(name: 'country_name') String? countryName,
      @JsonKey(name: 'country_code') String? countryCode,
      @JsonKey(name: 'country_code_iso3') String? countryCodeIso3,
      @JsonKey(name: 'country_capital') String? countryCapital,
      @JsonKey(name: 'country_tld') String? countryTld,
      @JsonKey(name: 'continent_code') String? continentCode,
      @JsonKey(name: 'in_eu') bool? inEu,
      String? timezone,
      @JsonKey(name: 'utc_offset') String? utcOffset,
      @JsonKey(name: 'country_calling_code') String? countryCallingCode,
      String? currency,
      @JsonKey(name: 'currency_name') String? currencyName,
      String? languages,
      @JsonKey(name: 'country_area') int? countryArea,
      @JsonKey(name: 'country_population') int? countryPopulation,
      String? asn,
      String? org}) {
    return _IPData(
      ip: ip,
      version: version,
      city: city,
      region: region,
      regionCode: regionCode,
      country: country,
      countryName: countryName,
      countryCode: countryCode,
      countryCodeIso3: countryCodeIso3,
      countryCapital: countryCapital,
      countryTld: countryTld,
      continentCode: continentCode,
      inEu: inEu,
      timezone: timezone,
      utcOffset: utcOffset,
      countryCallingCode: countryCallingCode,
      currency: currency,
      currencyName: currencyName,
      languages: languages,
      countryArea: countryArea,
      countryPopulation: countryPopulation,
      asn: asn,
      org: org,
    );
  }

  IPData fromJson(Map<String, Object?> json) {
    return IPData.fromJson(json);
  }
}

/// @nodoc
const $IPData = _$IPDataTearOff();

/// @nodoc
mixin _$IPData {
  String? get ip => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'region_code')
  String? get regionCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_name')
  String? get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code_iso3')
  String? get countryCodeIso3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_capital')
  String? get countryCapital => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_tld')
  String? get countryTld => throw _privateConstructorUsedError;
  @JsonKey(name: 'continent_code')
  String? get continentCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_eu')
  bool? get inEu => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: 'utc_offset')
  String? get utcOffset => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_calling_code')
  String? get countryCallingCode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_name')
  String? get currencyName => throw _privateConstructorUsedError;
  String? get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_area')
  int? get countryArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_population')
  int? get countryPopulation => throw _privateConstructorUsedError;
  String? get asn => throw _privateConstructorUsedError;
  String? get org => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IPDataCopyWith<IPData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IPDataCopyWith<$Res> {
  factory $IPDataCopyWith(IPData value, $Res Function(IPData) then) =
      _$IPDataCopyWithImpl<$Res>;
  $Res call(
      {String? ip,
      String? version,
      String? city,
      String? region,
      @JsonKey(name: 'region_code') String? regionCode,
      String? country,
      @JsonKey(name: 'country_name') String? countryName,
      @JsonKey(name: 'country_code') String? countryCode,
      @JsonKey(name: 'country_code_iso3') String? countryCodeIso3,
      @JsonKey(name: 'country_capital') String? countryCapital,
      @JsonKey(name: 'country_tld') String? countryTld,
      @JsonKey(name: 'continent_code') String? continentCode,
      @JsonKey(name: 'in_eu') bool? inEu,
      String? timezone,
      @JsonKey(name: 'utc_offset') String? utcOffset,
      @JsonKey(name: 'country_calling_code') String? countryCallingCode,
      String? currency,
      @JsonKey(name: 'currency_name') String? currencyName,
      String? languages,
      @JsonKey(name: 'country_area') int? countryArea,
      @JsonKey(name: 'country_population') int? countryPopulation,
      String? asn,
      String? org});
}

/// @nodoc
class _$IPDataCopyWithImpl<$Res> implements $IPDataCopyWith<$Res> {
  _$IPDataCopyWithImpl(this._value, this._then);

  final IPData _value;
  // ignore: unused_field
  final $Res Function(IPData) _then;

  @override
  $Res call({
    Object? ip = freezed,
    Object? version = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? regionCode = freezed,
    Object? country = freezed,
    Object? countryName = freezed,
    Object? countryCode = freezed,
    Object? countryCodeIso3 = freezed,
    Object? countryCapital = freezed,
    Object? countryTld = freezed,
    Object? continentCode = freezed,
    Object? inEu = freezed,
    Object? timezone = freezed,
    Object? utcOffset = freezed,
    Object? countryCallingCode = freezed,
    Object? currency = freezed,
    Object? currencyName = freezed,
    Object? languages = freezed,
    Object? countryArea = freezed,
    Object? countryPopulation = freezed,
    Object? asn = freezed,
    Object? org = freezed,
  }) {
    return _then(_value.copyWith(
      ip: ip == freezed
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      regionCode: regionCode == freezed
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: countryName == freezed
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCodeIso3: countryCodeIso3 == freezed
          ? _value.countryCodeIso3
          : countryCodeIso3 // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCapital: countryCapital == freezed
          ? _value.countryCapital
          : countryCapital // ignore: cast_nullable_to_non_nullable
              as String?,
      countryTld: countryTld == freezed
          ? _value.countryTld
          : countryTld // ignore: cast_nullable_to_non_nullable
              as String?,
      continentCode: continentCode == freezed
          ? _value.continentCode
          : continentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      inEu: inEu == freezed
          ? _value.inEu
          : inEu // ignore: cast_nullable_to_non_nullable
              as bool?,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      utcOffset: utcOffset == freezed
          ? _value.utcOffset
          : utcOffset // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCallingCode: countryCallingCode == freezed
          ? _value.countryCallingCode
          : countryCallingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyName: currencyName == freezed
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String?,
      countryArea: countryArea == freezed
          ? _value.countryArea
          : countryArea // ignore: cast_nullable_to_non_nullable
              as int?,
      countryPopulation: countryPopulation == freezed
          ? _value.countryPopulation
          : countryPopulation // ignore: cast_nullable_to_non_nullable
              as int?,
      asn: asn == freezed
          ? _value.asn
          : asn // ignore: cast_nullable_to_non_nullable
              as String?,
      org: org == freezed
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$IPDataCopyWith<$Res> implements $IPDataCopyWith<$Res> {
  factory _$IPDataCopyWith(_IPData value, $Res Function(_IPData) then) =
      __$IPDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? ip,
      String? version,
      String? city,
      String? region,
      @JsonKey(name: 'region_code') String? regionCode,
      String? country,
      @JsonKey(name: 'country_name') String? countryName,
      @JsonKey(name: 'country_code') String? countryCode,
      @JsonKey(name: 'country_code_iso3') String? countryCodeIso3,
      @JsonKey(name: 'country_capital') String? countryCapital,
      @JsonKey(name: 'country_tld') String? countryTld,
      @JsonKey(name: 'continent_code') String? continentCode,
      @JsonKey(name: 'in_eu') bool? inEu,
      String? timezone,
      @JsonKey(name: 'utc_offset') String? utcOffset,
      @JsonKey(name: 'country_calling_code') String? countryCallingCode,
      String? currency,
      @JsonKey(name: 'currency_name') String? currencyName,
      String? languages,
      @JsonKey(name: 'country_area') int? countryArea,
      @JsonKey(name: 'country_population') int? countryPopulation,
      String? asn,
      String? org});
}

/// @nodoc
class __$IPDataCopyWithImpl<$Res> extends _$IPDataCopyWithImpl<$Res>
    implements _$IPDataCopyWith<$Res> {
  __$IPDataCopyWithImpl(_IPData _value, $Res Function(_IPData) _then)
      : super(_value, (v) => _then(v as _IPData));

  @override
  _IPData get _value => super._value as _IPData;

  @override
  $Res call({
    Object? ip = freezed,
    Object? version = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? regionCode = freezed,
    Object? country = freezed,
    Object? countryName = freezed,
    Object? countryCode = freezed,
    Object? countryCodeIso3 = freezed,
    Object? countryCapital = freezed,
    Object? countryTld = freezed,
    Object? continentCode = freezed,
    Object? inEu = freezed,
    Object? timezone = freezed,
    Object? utcOffset = freezed,
    Object? countryCallingCode = freezed,
    Object? currency = freezed,
    Object? currencyName = freezed,
    Object? languages = freezed,
    Object? countryArea = freezed,
    Object? countryPopulation = freezed,
    Object? asn = freezed,
    Object? org = freezed,
  }) {
    return _then(_IPData(
      ip: ip == freezed
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      regionCode: regionCode == freezed
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: countryName == freezed
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCodeIso3: countryCodeIso3 == freezed
          ? _value.countryCodeIso3
          : countryCodeIso3 // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCapital: countryCapital == freezed
          ? _value.countryCapital
          : countryCapital // ignore: cast_nullable_to_non_nullable
              as String?,
      countryTld: countryTld == freezed
          ? _value.countryTld
          : countryTld // ignore: cast_nullable_to_non_nullable
              as String?,
      continentCode: continentCode == freezed
          ? _value.continentCode
          : continentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      inEu: inEu == freezed
          ? _value.inEu
          : inEu // ignore: cast_nullable_to_non_nullable
              as bool?,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      utcOffset: utcOffset == freezed
          ? _value.utcOffset
          : utcOffset // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCallingCode: countryCallingCode == freezed
          ? _value.countryCallingCode
          : countryCallingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyName: currencyName == freezed
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String?,
      countryArea: countryArea == freezed
          ? _value.countryArea
          : countryArea // ignore: cast_nullable_to_non_nullable
              as int?,
      countryPopulation: countryPopulation == freezed
          ? _value.countryPopulation
          : countryPopulation // ignore: cast_nullable_to_non_nullable
              as int?,
      asn: asn == freezed
          ? _value.asn
          : asn // ignore: cast_nullable_to_non_nullable
              as String?,
      org: org == freezed
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IPData implements _IPData {
  _$_IPData(
      {this.ip,
      this.version,
      this.city,
      this.region,
      @JsonKey(name: 'region_code') this.regionCode,
      this.country,
      @JsonKey(name: 'country_name') this.countryName,
      @JsonKey(name: 'country_code') this.countryCode,
      @JsonKey(name: 'country_code_iso3') this.countryCodeIso3,
      @JsonKey(name: 'country_capital') this.countryCapital,
      @JsonKey(name: 'country_tld') this.countryTld,
      @JsonKey(name: 'continent_code') this.continentCode,
      @JsonKey(name: 'in_eu') this.inEu,
      this.timezone,
      @JsonKey(name: 'utc_offset') this.utcOffset,
      @JsonKey(name: 'country_calling_code') this.countryCallingCode,
      this.currency,
      @JsonKey(name: 'currency_name') this.currencyName,
      this.languages,
      @JsonKey(name: 'country_area') this.countryArea,
      @JsonKey(name: 'country_population') this.countryPopulation,
      this.asn,
      this.org});

  factory _$_IPData.fromJson(Map<String, dynamic> json) =>
      _$$_IPDataFromJson(json);

  @override
  final String? ip;
  @override
  final String? version;
  @override
  final String? city;
  @override
  final String? region;
  @override
  @JsonKey(name: 'region_code')
  final String? regionCode;
  @override
  final String? country;
  @override
  @JsonKey(name: 'country_name')
  final String? countryName;
  @override
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @override
  @JsonKey(name: 'country_code_iso3')
  final String? countryCodeIso3;
  @override
  @JsonKey(name: 'country_capital')
  final String? countryCapital;
  @override
  @JsonKey(name: 'country_tld')
  final String? countryTld;
  @override
  @JsonKey(name: 'continent_code')
  final String? continentCode;
  @override
  @JsonKey(name: 'in_eu')
  final bool? inEu;
  @override
  final String? timezone;
  @override
  @JsonKey(name: 'utc_offset')
  final String? utcOffset;
  @override
  @JsonKey(name: 'country_calling_code')
  final String? countryCallingCode;
  @override
  final String? currency;
  @override
  @JsonKey(name: 'currency_name')
  final String? currencyName;
  @override
  final String? languages;
  @override
  @JsonKey(name: 'country_area')
  final int? countryArea;
  @override
  @JsonKey(name: 'country_population')
  final int? countryPopulation;
  @override
  final String? asn;
  @override
  final String? org;

  @override
  String toString() {
    return 'IPData(ip: $ip, version: $version, city: $city, region: $region, regionCode: $regionCode, country: $country, countryName: $countryName, countryCode: $countryCode, countryCodeIso3: $countryCodeIso3, countryCapital: $countryCapital, countryTld: $countryTld, continentCode: $continentCode, inEu: $inEu, timezone: $timezone, utcOffset: $utcOffset, countryCallingCode: $countryCallingCode, currency: $currency, currencyName: $currencyName, languages: $languages, countryArea: $countryArea, countryPopulation: $countryPopulation, asn: $asn, org: $org)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IPData &&
            const DeepCollectionEquality().equals(other.ip, ip) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality()
                .equals(other.regionCode, regionCode) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.countryName, countryName) &&
            const DeepCollectionEquality()
                .equals(other.countryCode, countryCode) &&
            const DeepCollectionEquality()
                .equals(other.countryCodeIso3, countryCodeIso3) &&
            const DeepCollectionEquality()
                .equals(other.countryCapital, countryCapital) &&
            const DeepCollectionEquality()
                .equals(other.countryTld, countryTld) &&
            const DeepCollectionEquality()
                .equals(other.continentCode, continentCode) &&
            const DeepCollectionEquality().equals(other.inEu, inEu) &&
            const DeepCollectionEquality().equals(other.timezone, timezone) &&
            const DeepCollectionEquality().equals(other.utcOffset, utcOffset) &&
            const DeepCollectionEquality()
                .equals(other.countryCallingCode, countryCallingCode) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality()
                .equals(other.currencyName, currencyName) &&
            const DeepCollectionEquality().equals(other.languages, languages) &&
            const DeepCollectionEquality()
                .equals(other.countryArea, countryArea) &&
            const DeepCollectionEquality()
                .equals(other.countryPopulation, countryPopulation) &&
            const DeepCollectionEquality().equals(other.asn, asn) &&
            const DeepCollectionEquality().equals(other.org, org));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(ip),
        const DeepCollectionEquality().hash(version),
        const DeepCollectionEquality().hash(city),
        const DeepCollectionEquality().hash(region),
        const DeepCollectionEquality().hash(regionCode),
        const DeepCollectionEquality().hash(country),
        const DeepCollectionEquality().hash(countryName),
        const DeepCollectionEquality().hash(countryCode),
        const DeepCollectionEquality().hash(countryCodeIso3),
        const DeepCollectionEquality().hash(countryCapital),
        const DeepCollectionEquality().hash(countryTld),
        const DeepCollectionEquality().hash(continentCode),
        const DeepCollectionEquality().hash(inEu),
        const DeepCollectionEquality().hash(timezone),
        const DeepCollectionEquality().hash(utcOffset),
        const DeepCollectionEquality().hash(countryCallingCode),
        const DeepCollectionEquality().hash(currency),
        const DeepCollectionEquality().hash(currencyName),
        const DeepCollectionEquality().hash(languages),
        const DeepCollectionEquality().hash(countryArea),
        const DeepCollectionEquality().hash(countryPopulation),
        const DeepCollectionEquality().hash(asn),
        const DeepCollectionEquality().hash(org)
      ]);

  @JsonKey(ignore: true)
  @override
  _$IPDataCopyWith<_IPData> get copyWith =>
      __$IPDataCopyWithImpl<_IPData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IPDataToJson(this);
  }
}

abstract class _IPData implements IPData {
  factory _IPData(
      {String? ip,
      String? version,
      String? city,
      String? region,
      @JsonKey(name: 'region_code') String? regionCode,
      String? country,
      @JsonKey(name: 'country_name') String? countryName,
      @JsonKey(name: 'country_code') String? countryCode,
      @JsonKey(name: 'country_code_iso3') String? countryCodeIso3,
      @JsonKey(name: 'country_capital') String? countryCapital,
      @JsonKey(name: 'country_tld') String? countryTld,
      @JsonKey(name: 'continent_code') String? continentCode,
      @JsonKey(name: 'in_eu') bool? inEu,
      String? timezone,
      @JsonKey(name: 'utc_offset') String? utcOffset,
      @JsonKey(name: 'country_calling_code') String? countryCallingCode,
      String? currency,
      @JsonKey(name: 'currency_name') String? currencyName,
      String? languages,
      @JsonKey(name: 'country_area') int? countryArea,
      @JsonKey(name: 'country_population') int? countryPopulation,
      String? asn,
      String? org}) = _$_IPData;

  factory _IPData.fromJson(Map<String, dynamic> json) = _$_IPData.fromJson;

  @override
  String? get ip;
  @override
  String? get version;
  @override
  String? get city;
  @override
  String? get region;
  @override
  @JsonKey(name: 'region_code')
  String? get regionCode;
  @override
  String? get country;
  @override
  @JsonKey(name: 'country_name')
  String? get countryName;
  @override
  @JsonKey(name: 'country_code')
  String? get countryCode;
  @override
  @JsonKey(name: 'country_code_iso3')
  String? get countryCodeIso3;
  @override
  @JsonKey(name: 'country_capital')
  String? get countryCapital;
  @override
  @JsonKey(name: 'country_tld')
  String? get countryTld;
  @override
  @JsonKey(name: 'continent_code')
  String? get continentCode;
  @override
  @JsonKey(name: 'in_eu')
  bool? get inEu;
  @override
  String? get timezone;
  @override
  @JsonKey(name: 'utc_offset')
  String? get utcOffset;
  @override
  @JsonKey(name: 'country_calling_code')
  String? get countryCallingCode;
  @override
  String? get currency;
  @override
  @JsonKey(name: 'currency_name')
  String? get currencyName;
  @override
  String? get languages;
  @override
  @JsonKey(name: 'country_area')
  int? get countryArea;
  @override
  @JsonKey(name: 'country_population')
  int? get countryPopulation;
  @override
  String? get asn;
  @override
  String? get org;
  @override
  @JsonKey(ignore: true)
  _$IPDataCopyWith<_IPData> get copyWith => throw _privateConstructorUsedError;
}
