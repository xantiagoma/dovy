import 'package:dovy/general.dart';
part 'line.freezed.dart';
part 'line.g.dart';

@freezed
abstract class Line with _$Line {
  factory Line({
    String id,
    String color,
    String name,
    String code,
    String shape,
    @JsonKey(
      fromJson: stationsFromJson,
      // toJson: stationsToJson,
    )
        List<Station> stations,
  }) = _Line;

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
}

List<Station> stationsFromJson(dynamic val) {
  if (val == null) {
    return [];
  }

  if (val is List) {
    return val.map((e) {
      if (e is String) {
        e = {"id": e};
      }
      return Station.fromJson(e);
    }).toList();
  }
}

// List<Map<String, dynamic>> stationsToJson(List<Station> stations) {
//   print(stations);
// }
