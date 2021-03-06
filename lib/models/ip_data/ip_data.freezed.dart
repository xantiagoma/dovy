// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ip_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
IPData _$IPDataFromJson(Map<String, dynamic> json) {
  return _IPData.fromJson(json);
}

/// @nodoc
class _$IPDataTearOff {
  const _$IPDataTearOff();

// ignore: unused_element
  _IPData call(
      {String ip,
      String version,
      String city,
      String region,
      @JsonKey(name: 'region_code') String regionCode,
      String country,
      @JsonKey(name: 'country_name') String countryName,
      @JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'country_code_iso3') String countryCodeIso3,
      @JsonKey(name: 'country_capital') String countryCapital,
      @JsonKey(name: 'country_tld') String countryTld,
      @JsonKey(name: 'continent_code') String continentCode,
      @JsonKey(name: 'in_eu') bool inEu,
      String timezone,
      @JsonKey(name: 'utc_offset') String utcOffset,
      @JsonKey(name: 'country_calling_code') String countryCallingCode,
      String currency,
      @JsonKey(name: 'currency_name') String currencyName,
      String languages,
      @JsonKey(name: 'country_area') int countryArea,
      @JsonKey(name: 'country_population') int countryPopulation,
      String asn,
      String org}) {
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

// ignore: unused_element
  IPData fromJson(Map<String, Object> json) {
    return IPData.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $IPData = _$IPDataTearOff();

/// @nodoc
mixin _$IPData {
  String get ip;
  String get version;
  String get city;
  String get region;
  @JsonKey(name: 'region_code')
  String get regionCode;
  String get country;
  @JsonKey(name: 'country_name')
  String get countryName;
  @JsonKey(name: 'country_code')
  String get countryCode;
  @JsonKey(name: 'country_code_iso3')
  String get countryCodeIso3;
  @JsonKey(name: 'country_capital')
  String get countryCapital;
  @JsonKey(name: 'country_tld')
  String get countryTld;
  @JsonKey(name: 'continent_code')
  String get continentCode;
  @JsonKey(name: 'in_eu')
  bool get inEu;
  String get timezone;
  @JsonKey(name: 'utc_offset')
  String get utcOffset;
  @JsonKey(name: 'country_calling_code')
  String get countryCallingCode;
  String get currency;
  @JsonKey(name: 'currency_name')
  String get currencyName;
  String get languages;
  @JsonKey(name: 'country_area')
  int get countryArea;
  @JsonKey(name: 'country_population')
  int get countryPopulation;
  String get asn;
  String get org;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $IPDataCopyWith<IPData> get copyWith;
}

/// @nodoc
abstract class $IPDataCopyWith<$Res> {
  factory $IPDataCopyWith(IPData value, $Res Function(IPData) then) =
      _$IPDataCopyWithImpl<$Res>;
  $Res call(
      {String ip,
      String version,
      String city,
      String region,
      @JsonKey(name: 'region_code') String regionCode,
      String country,
      @JsonKey(name: 'country_name') String countryName,
      @JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'country_code_iso3') String countryCodeIso3,
      @JsonKey(name: 'country_capital') String countryCapital,
      @JsonKey(name: 'country_tld') String countryTld,
      @JsonKey(name: 'continent_code') String continentCode,
      @JsonKey(name: 'in_eu') bool inEu,
      String timezone,
      @JsonKey(name: 'utc_offset') String utcOffset,
      @JsonKey(name: 'country_calling_code') String countryCallingCode,
      String currency,
      @JsonKey(name: 'currency_name') String currencyName,
      String languages,
      @JsonKey(name: 'country_area') int countryArea,
      @JsonKey(name: 'country_population') int countryPopulation,
      String asn,
      String org});
}

/// @nodoc
class _$IPDataCopyWithImpl<$Res> implements $IPDataCopyWith<$Res> {
  _$IPDataCopyWithImpl(this._value, this._then);

  final IPData _value;
  // ignore: unused_field
  final $Res Function(IPData) _then;

  @override
  $Res call({
    Object ip = freezed,
    Object version = freezed,
    Object city = freezed,
    Object region = freezed,
    Object regionCode = freezed,
    Object country = freezed,
    Object countryName = freezed,
    Object countryCode = freezed,
    Object countryCodeIso3 = freezed,
    Object countryCapital = freezed,
    Object countryTld = freezed,
    Object continentCode = freezed,
    Object inEu = freezed,
    Object timezone = freezed,
    Object utcOffset = freezed,
    Object countryCallingCode = freezed,
    Object currency = freezed,
    Object currencyName = freezed,
    Object languages = freezed,
    Object countryArea = freezed,
    Object countryPopulation = freezed,
    Object asn = freezed,
    Object org = freezed,
  }) {
    return _then(_value.copyWith(
      ip: ip == freezed ? _value.ip : ip as String,
      version: version == freezed ? _value.version : version as String,
      city: city == freezed ? _value.city : city as String,
      region: region == freezed ? _value.region : region as String,
      regionCode:
          regionCode == freezed ? _value.regionCode : regionCode as String,
      country: country == freezed ? _value.country : country as String,
      countryName:
          countryName == freezed ? _value.countryName : countryName as String,
      countryCode:
          countryCode == freezed ? _value.countryCode : countryCode as String,
      countryCodeIso3: countryCodeIso3 == freezed
          ? _value.countryCodeIso3
          : countryCodeIso3 as String,
      countryCapital: countryCapital == freezed
          ? _value.countryCapital
          : countryCapital as String,
      countryTld:
          countryTld == freezed ? _value.countryTld : countryTld as String,
      continentCode: continentCode == freezed
          ? _value.continentCode
          : continentCode as String,
      inEu: inEu == freezed ? _value.inEu : inEu as bool,
      timezone: timezone == freezed ? _value.timezone : timezone as String,
      utcOffset: utcOffset == freezed ? _value.utcOffset : utcOffset as String,
      countryCallingCode: countryCallingCode == freezed
          ? _value.countryCallingCode
          : countryCallingCode as String,
      currency: currency == freezed ? _value.currency : currency as String,
      currencyName: currencyName == freezed
          ? _value.currencyName
          : currencyName as String,
      languages: languages == freezed ? _value.languages : languages as String,
      countryArea:
          countryArea == freezed ? _value.countryArea : countryArea as int,
      countryPopulation: countryPopulation == freezed
          ? _value.countryPopulation
          : countryPopulation as int,
      asn: asn == freezed ? _value.asn : asn as String,
      org: org == freezed ? _value.org : org as String,
    ));
  }
}

/// @nodoc
abstract class _$IPDataCopyWith<$Res> implements $IPDataCopyWith<$Res> {
  factory _$IPDataCopyWith(_IPData value, $Res Function(_IPData) then) =
      __$IPDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String ip,
      String version,
      String city,
      String region,
      @JsonKey(name: 'region_code') String regionCode,
      String country,
      @JsonKey(name: 'country_name') String countryName,
      @JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'country_code_iso3') String countryCodeIso3,
      @JsonKey(name: 'country_capital') String countryCapital,
      @JsonKey(name: 'country_tld') String countryTld,
      @JsonKey(name: 'continent_code') String continentCode,
      @JsonKey(name: 'in_eu') bool inEu,
      String timezone,
      @JsonKey(name: 'utc_offset') String utcOffset,
      @JsonKey(name: 'country_calling_code') String countryCallingCode,
      String currency,
      @JsonKey(name: 'currency_name') String currencyName,
      String languages,
      @JsonKey(name: 'country_area') int countryArea,
      @JsonKey(name: 'country_population') int countryPopulation,
      String asn,
      String org});
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
    Object ip = freezed,
    Object version = freezed,
    Object city = freezed,
    Object region = freezed,
    Object regionCode = freezed,
    Object country = freezed,
    Object countryName = freezed,
    Object countryCode = freezed,
    Object countryCodeIso3 = freezed,
    Object countryCapital = freezed,
    Object countryTld = freezed,
    Object continentCode = freezed,
    Object inEu = freezed,
    Object timezone = freezed,
    Object utcOffset = freezed,
    Object countryCallingCode = freezed,
    Object currency = freezed,
    Object currencyName = freezed,
    Object languages = freezed,
    Object countryArea = freezed,
    Object countryPopulation = freezed,
    Object asn = freezed,
    Object org = freezed,
  }) {
    return _then(_IPData(
      ip: ip == freezed ? _value.ip : ip as String,
      version: version == freezed ? _value.version : version as String,
      city: city == freezed ? _value.city : city as String,
      region: region == freezed ? _value.region : region as String,
      regionCode:
          regionCode == freezed ? _value.regionCode : regionCode as String,
      country: country == freezed ? _value.country : country as String,
      countryName:
          countryName == freezed ? _value.countryName : countryName as String,
      countryCode:
          countryCode == freezed ? _value.countryCode : countryCode as String,
      countryCodeIso3: countryCodeIso3 == freezed
          ? _value.countryCodeIso3
          : countryCodeIso3 as String,
      countryCapital: countryCapital == freezed
          ? _value.countryCapital
          : countryCapital as String,
      countryTld:
          countryTld == freezed ? _value.countryTld : countryTld as String,
      continentCode: continentCode == freezed
          ? _value.continentCode
          : continentCode as String,
      inEu: inEu == freezed ? _value.inEu : inEu as bool,
      timezone: timezone == freezed ? _value.timezone : timezone as String,
      utcOffset: utcOffset == freezed ? _value.utcOffset : utcOffset as String,
      countryCallingCode: countryCallingCode == freezed
          ? _value.countryCallingCode
          : countryCallingCode as String,
      currency: currency == freezed ? _value.currency : currency as String,
      currencyName: currencyName == freezed
          ? _value.currencyName
          : currencyName as String,
      languages: languages == freezed ? _value.languages : languages as String,
      countryArea:
          countryArea == freezed ? _value.countryArea : countryArea as int,
      countryPopulation: countryPopulation == freezed
          ? _value.countryPopulation
          : countryPopulation as int,
      asn: asn == freezed ? _value.asn : asn as String,
      org: org == freezed ? _value.org : org as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
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
      _$_$_IPDataFromJson(json);

  @override
  final String ip;
  @override
  final String version;
  @override
  final String city;
  @override
  final String region;
  @override
  @JsonKey(name: 'region_code')
  final String regionCode;
  @override
  final String country;
  @override
  @JsonKey(name: 'country_name')
  final String countryName;
  @override
  @JsonKey(name: 'country_code')
  final String countryCode;
  @override
  @JsonKey(name: 'country_code_iso3')
  final String countryCodeIso3;
  @override
  @JsonKey(name: 'country_capital')
  final String countryCapital;
  @override
  @JsonKey(name: 'country_tld')
  final String countryTld;
  @override
  @JsonKey(name: 'continent_code')
  final String continentCode;
  @override
  @JsonKey(name: 'in_eu')
  final bool inEu;
  @override
  final String timezone;
  @override
  @JsonKey(name: 'utc_offset')
  final String utcOffset;
  @override
  @JsonKey(name: 'country_calling_code')
  final String countryCallingCode;
  @override
  final String currency;
  @override
  @JsonKey(name: 'currency_name')
  final String currencyName;
  @override
  final String languages;
  @override
  @JsonKey(name: 'country_area')
  final int countryArea;
  @override
  @JsonKey(name: 'country_population')
  final int countryPopulation;
  @override
  final String asn;
  @override
  final String org;

  @override
  String toString() {
    return 'IPData(ip: $ip, version: $version, city: $city, region: $region, regionCode: $regionCode, country: $country, countryName: $countryName, countryCode: $countryCode, countryCodeIso3: $countryCodeIso3, countryCapital: $countryCapital, countryTld: $countryTld, continentCode: $continentCode, inEu: $inEu, timezone: $timezone, utcOffset: $utcOffset, countryCallingCode: $countryCallingCode, currency: $currency, currencyName: $currencyName, languages: $languages, countryArea: $countryArea, countryPopulation: $countryPopulation, asn: $asn, org: $org)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IPData &&
            (identical(other.ip, ip) ||
                const DeepCollectionEquality().equals(other.ip, ip)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.region, region) ||
                const DeepCollectionEquality().equals(other.region, region)) &&
            (identical(other.regionCode, regionCode) ||
                const DeepCollectionEquality()
                    .equals(other.regionCode, regionCode)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.countryName, countryName) ||
                const DeepCollectionEquality()
                    .equals(other.countryName, countryName)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.countryCodeIso3, countryCodeIso3) ||
                const DeepCollectionEquality()
                    .equals(other.countryCodeIso3, countryCodeIso3)) &&
            (identical(other.countryCapital, countryCapital) ||
                const DeepCollectionEquality()
                    .equals(other.countryCapital, countryCapital)) &&
            (identical(other.countryTld, countryTld) ||
                const DeepCollectionEquality()
                    .equals(other.countryTld, countryTld)) &&
            (identical(other.continentCode, continentCode) ||
                const DeepCollectionEquality()
                    .equals(other.continentCode, continentCode)) &&
            (identical(other.inEu, inEu) ||
                const DeepCollectionEquality().equals(other.inEu, inEu)) &&
            (identical(other.timezone, timezone) ||
                const DeepCollectionEquality()
                    .equals(other.timezone, timezone)) &&
            (identical(other.utcOffset, utcOffset) ||
                const DeepCollectionEquality()
                    .equals(other.utcOffset, utcOffset)) &&
            (identical(other.countryCallingCode, countryCallingCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCallingCode, countryCallingCode)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.currencyName, currencyName) ||
                const DeepCollectionEquality()
                    .equals(other.currencyName, currencyName)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.countryArea, countryArea) ||
                const DeepCollectionEquality()
                    .equals(other.countryArea, countryArea)) &&
            (identical(other.countryPopulation, countryPopulation) ||
                const DeepCollectionEquality()
                    .equals(other.countryPopulation, countryPopulation)) &&
            (identical(other.asn, asn) ||
                const DeepCollectionEquality().equals(other.asn, asn)) &&
            (identical(other.org, org) ||
                const DeepCollectionEquality().equals(other.org, org)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ip) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(region) ^
      const DeepCollectionEquality().hash(regionCode) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(countryName) ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(countryCodeIso3) ^
      const DeepCollectionEquality().hash(countryCapital) ^
      const DeepCollectionEquality().hash(countryTld) ^
      const DeepCollectionEquality().hash(continentCode) ^
      const DeepCollectionEquality().hash(inEu) ^
      const DeepCollectionEquality().hash(timezone) ^
      const DeepCollectionEquality().hash(utcOffset) ^
      const DeepCollectionEquality().hash(countryCallingCode) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(currencyName) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(countryArea) ^
      const DeepCollectionEquality().hash(countryPopulation) ^
      const DeepCollectionEquality().hash(asn) ^
      const DeepCollectionEquality().hash(org);

  @JsonKey(ignore: true)
  @override
  _$IPDataCopyWith<_IPData> get copyWith =>
      __$IPDataCopyWithImpl<_IPData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IPDataToJson(this);
  }
}

abstract class _IPData implements IPData {
  factory _IPData(
      {String ip,
      String version,
      String city,
      String region,
      @JsonKey(name: 'region_code') String regionCode,
      String country,
      @JsonKey(name: 'country_name') String countryName,
      @JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'country_code_iso3') String countryCodeIso3,
      @JsonKey(name: 'country_capital') String countryCapital,
      @JsonKey(name: 'country_tld') String countryTld,
      @JsonKey(name: 'continent_code') String continentCode,
      @JsonKey(name: 'in_eu') bool inEu,
      String timezone,
      @JsonKey(name: 'utc_offset') String utcOffset,
      @JsonKey(name: 'country_calling_code') String countryCallingCode,
      String currency,
      @JsonKey(name: 'currency_name') String currencyName,
      String languages,
      @JsonKey(name: 'country_area') int countryArea,
      @JsonKey(name: 'country_population') int countryPopulation,
      String asn,
      String org}) = _$_IPData;

  factory _IPData.fromJson(Map<String, dynamic> json) = _$_IPData.fromJson;

  @override
  String get ip;
  @override
  String get version;
  @override
  String get city;
  @override
  String get region;
  @override
  @JsonKey(name: 'region_code')
  String get regionCode;
  @override
  String get country;
  @override
  @JsonKey(name: 'country_name')
  String get countryName;
  @override
  @JsonKey(name: 'country_code')
  String get countryCode;
  @override
  @JsonKey(name: 'country_code_iso3')
  String get countryCodeIso3;
  @override
  @JsonKey(name: 'country_capital')
  String get countryCapital;
  @override
  @JsonKey(name: 'country_tld')
  String get countryTld;
  @override
  @JsonKey(name: 'continent_code')
  String get continentCode;
  @override
  @JsonKey(name: 'in_eu')
  bool get inEu;
  @override
  String get timezone;
  @override
  @JsonKey(name: 'utc_offset')
  String get utcOffset;
  @override
  @JsonKey(name: 'country_calling_code')
  String get countryCallingCode;
  @override
  String get currency;
  @override
  @JsonKey(name: 'currency_name')
  String get currencyName;
  @override
  String get languages;
  @override
  @JsonKey(name: 'country_area')
  int get countryArea;
  @override
  @JsonKey(name: 'country_population')
  int get countryPopulation;
  @override
  String get asn;
  @override
  String get org;
  @override
  @JsonKey(ignore: true)
  _$IPDataCopyWith<_IPData> get copyWith;
}
