import 'package:dovy/general.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'select_state.freezed.dart';

@freezed
abstract class SelectState with _$SelectState {
  factory SelectState({
    @nullable String system,
    @nullable String line,
    @nullable String station,
  }) = _SelectState;
}

extension SelectState_ on SelectState {
  SelectState setSystem(String system) => this.copyWith(
        system: system,
        line: null,
        station: null,
      );

  SelectState setLine(String line) => this.copyWith(
        line: line,
        station: null,
      );

  SelectState setStation(String station) => this.copyWith(
        station: station,
      );
}
