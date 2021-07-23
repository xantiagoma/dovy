import 'package:dovy/general.dart';
part 'line.freezed.dart';
part 'line.g.dart';

@freezed
class Line with _$Line {
  factory Line({
    int? id,
    String? color,
    String? name,
    String? code,
    String? shape,
    @JsonKey(
      fromJson: stationsFromJson,
    )
        List<Station>? stations,
    LineDescription? description,
  }) = _Line;

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
}

extension Line_ on Line {
  List<LatLng> get points => shape?.toLatLngList() ?? [];
}

List<Station> stationsFromJson(List<dynamic>? val) {
  if (val == null) {
    return [];
  }

  if (val is List) {
    return val.map((e) {
      if (e is int) {
        e = {"id": e};
      }
      return Station.fromJson(e);
    }).toList();
  }

  return [];
}

@freezed
class LineDescription with _$LineDescription {
  factory LineDescription({
    @JsonKey(name: 'Body') String? body,
  }) = _LineDescription;

  factory LineDescription.fromJson(Map<String, dynamic> json) =>
      _$LineDescriptionFromJson(json);
}
