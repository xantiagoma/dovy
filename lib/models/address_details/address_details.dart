import 'package:dovy/general.dart';
part 'address_details.freezed.dart';
part 'address_details.g.dart';

@freezed
abstract class AddressDetails with _$AddressDetails {
  factory AddressDetails({
    @JsonKey(name: 'place_id') int placeId,
    String licence,
    @JsonKey(name: 'osm_type') String osmType,
    @JsonKey(name: 'osm_id') int osmId,
    String lat,
    String lon,
    @JsonKey(name: 'place_rank') int placeRank,
    String category,
    String type,
    double importance,
    String addresstype,
    String name,
    @JsonKey(name: 'display_name') String displayName,
    Address address,
    Map<String, dynamic> extratags,
    Namedetails namedetails,
    List<String> boundingbox,
  }) = _AddressDetails;

  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);
}

@freezed
abstract class Address with _$Address {
  factory Address({
    String neighbourhood,
    String suburb,
    @JsonKey(name: 'city_district') String cityDistrict,
    String city,
    @JsonKey(name: 'state_district') String stateDistrict,
    String state,
    String region,
    String postcode,
    String country,
    @JsonKey(name: 'country_code') String countryCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
abstract class Namedetails with _$Namedetails {
  factory Namedetails({String name}) = _Namedetails;

  factory Namedetails.fromJson(Map<String, dynamic> json) =>
      _$NamedetailsFromJson(json);
}
