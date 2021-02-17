import 'package:dovy/general.dart';
import 'package:equatable/equatable.dart';

class SelectState extends Equatable {
  final String system;
  final String line;
  final String station;

  SelectState({
    @required this.system,
    @required this.line,
    @required this.station,
  });

  SelectState copyWith({
    String system,
    String line,
    String station,
  }) =>
      SelectState(
        system: system ?? this.system,
        line: line ?? this.line,
        station: station ?? this.station,
      );

  SelectState setSystem(String system) => SelectState(
        system: system,
        line: null,
        station: null,
      );

  SelectState setLine(String line) => SelectState(
        system: this.system,
        line: line,
        station: null,
      );

  SelectState setStation(String station) => SelectState(
        system: this.system,
        line: this.line,
        station: station,
      );

  @override
  List<Object> get props => [
        system,
        line,
        station,
      ];

  @override
  bool get stringify => true;
}
