// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressDetails _$$_AddressDetailsFromJson(Map<String, dynamic> json) =>
    _$_AddressDetails(
      placeId: json['place_id'] as int?,
      licence: json['licence'] as String?,
      osmType: json['osm_type'] as String?,
      osmId: json['osm_id'] as int?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      placeRank: json['place_rank'] as int?,
      category: json['category'] as String?,
      type: json['type'] as String?,
      importance: (json['importance'] as num?)?.toDouble(),
      addresstype: json['addresstype'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      extratags: json['extratags'] as Map<String, dynamic>?,
      namedetails: json['namedetails'] == null
          ? null
          : Namedetails.fromJson(json['namedetails'] as Map<String, dynamic>),
      boundingbox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AddressDetailsToJson(_$_AddressDetails instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'licence': instance.licence,
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'lat': instance.lat,
      'lon': instance.lon,
      'place_rank': instance.placeRank,
      'category': instance.category,
      'type': instance.type,
      'importance': instance.importance,
      'addresstype': instance.addresstype,
      'name': instance.name,
      'display_name': instance.displayName,
      'address': instance.address?.toJson(),
      'extratags': instance.extratags,
      'namedetails': instance.namedetails?.toJson(),
      'boundingbox': instance.boundingbox,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      neighbourhood: json['neighbourhood'] as String?,
      suburb: json['suburb'] as String?,
      cityDistrict: json['city_district'] as String?,
      city: json['city'] as String?,
      stateDistrict: json['state_district'] as String?,
      state: json['state'] as String?,
      region: json['region'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'neighbourhood': instance.neighbourhood,
      'suburb': instance.suburb,
      'city_district': instance.cityDistrict,
      'city': instance.city,
      'state_district': instance.stateDistrict,
      'state': instance.state,
      'region': instance.region,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.countryCode,
    };

_$_Namedetails _$$_NamedetailsFromJson(Map<String, dynamic> json) =>
    _$_Namedetails(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_NamedetailsToJson(_$_Namedetails instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
