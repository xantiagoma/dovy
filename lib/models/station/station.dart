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
    Map<String, dynamic> location,
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

// List<Map<String, dynamic>> linesToJson(List<Line> stations) {
//   print(stations);
// }
