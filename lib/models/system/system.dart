import 'package:dovy/general.dart';
part 'system.freezed.dart';
part 'system.g.dart';

@freezed
abstract class System with _$System {
  factory System({
    String id,
    String name,
    String code,
    List<Line> lines,
  }) = _System;

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);
}
