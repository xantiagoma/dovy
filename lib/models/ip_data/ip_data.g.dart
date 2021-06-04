// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IPData _$_$_IPDataFromJson(Map<String, dynamic> json) {
  return _$_IPData(
    ip: json['ip'] as String?,
    version: json['version'] as String?,
    city: json['city'] as String?,
    region: json['region'] as String?,
    regionCode: json['region_code'] as String?,
    country: json['country'] as String?,
    countryName: json['country_name'] as String?,
    countryCode: json['country_code'] as String?,
    countryCodeIso3: json['country_code_iso3'] as String?,
    countryCapital: json['country_capital'] as String?,
    countryTld: json['country_tld'] as String?,
    continentCode: json['continent_code'] as String?,
    inEu: json['in_eu'] as bool?,
    timezone: json['timezone'] as String?,
    utcOffset: json['utc_offset'] as String?,
    countryCallingCode: json['country_calling_code'] as String?,
    currency: json['currency'] as String?,
    currencyName: json['currency_name'] as String?,
    languages: json['languages'] as String?,
    countryArea: json['country_area'] as int?,
    countryPopulation: json['country_population'] as int?,
    asn: json['asn'] as String?,
    org: json['org'] as String?,
  );
}

Map<String, dynamic> _$_$_IPDataToJson(_$_IPData instance) => <String, dynamic>{
      'ip': instance.ip,
      'version': instance.version,
      'city': instance.city,
      'region': instance.region,
      'region_code': instance.regionCode,
      'country': instance.country,
      'country_name': instance.countryName,
      'country_code': instance.countryCode,
      'country_code_iso3': instance.countryCodeIso3,
      'country_capital': instance.countryCapital,
      'country_tld': instance.countryTld,
      'continent_code': instance.continentCode,
      'in_eu': instance.inEu,
      'timezone': instance.timezone,
      'utc_offset': instance.utcOffset,
      'country_calling_code': instance.countryCallingCode,
      'currency': instance.currency,
      'currency_name': instance.currencyName,
      'languages': instance.languages,
      'country_area': instance.countryArea,
      'country_population': instance.countryPopulation,
      'asn': instance.asn,
      'org': instance.org,
    };
