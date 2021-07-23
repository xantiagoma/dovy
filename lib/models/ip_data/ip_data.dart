import 'package:dovy/general.dart';
part 'ip_data.freezed.dart';
part 'ip_data.g.dart';

@freezed
class IPData with _$IPData {
  factory IPData({
    String? ip,
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
    String? org,
  }) = _IPData;

  factory IPData.fromJson(Map<String, dynamic> json) => _$IPDataFromJson(json);
}
