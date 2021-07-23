import 'package:dovy/general.dart';
part 'select_state.freezed.dart';

@freezed
class SelectState with _$SelectState {
  factory SelectState({
    int? system,
    int? line,
    int? station,
  }) = _SelectState;
}

extension SelectState_ on SelectState {
  SelectState setSystem(int? system) => this.copyWith(
        system: system,
        line: null,
        station: null,
      );

  SelectState setLine(int? line) => this.copyWith(
        line: line,
        station: null,
      );

  SelectState setStation(int? station) => this.copyWith(
        station: station,
      );
}
