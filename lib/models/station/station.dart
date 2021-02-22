import 'package:dovy/general.dart';
part 'station.freezed.dart';
part 'station.g.dart';

@freezed
abstract class Station with _$Station {
  factory Station({
    String id,
    String name,
    String code,
    @JsonKey(
      fromJson: linesFromJson,
      // toJson: linesToJson,
    )
        List<Line> lines,
    @JsonKey(
      fromJson: locationFromJson,
      toJson: locationToJson,
    )
        LatLng location,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
}

List<Line> linesFromJson(dynamic val) {
  if (val == null) {
    return [];
  }

  if (val is List) {
    return val.map((e) {
      if (e is String) {
        e = {"id": e};
      }
      return Line.fromJson(e);
    }).toList();
  }
}

LatLng locationFromJson(Map<String, dynamic> json) {
  if (json == null) {
    return null;
  }
  if (json["latitude"] == null || json["longitude"] == null) {
    return null;
  }

  return LatLng(
    json["latitude"],
    json["longitude"],
  );
}

Map<String, dynamic> locationToJson(LatLng location) {
  if (location == null) {
    return null;
  }

  return {
    "latitude": location.latitude,
    "longitude": location.longitude,
  };
}

// List<Map<String, dynamic>> linesToJson(List<Line> stations) {
//   print(stations);
// }
