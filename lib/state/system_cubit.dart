import 'dart:async';

import 'package:dovy/general.dart';
import 'package:dovy/graphql.dart';
import 'package:equatable/equatable.dart';

class SystemSelectState extends Equatable {
  final String system;
  final String line;
  final String station;

  SystemSelectState({
    @required this.system,
    @required this.line,
    @required this.station,
  });

  SystemSelectState copyWith({
    String system,
    String line,
    String station,
  }) =>
      SystemSelectState(
        system: system ?? this.system,
        line: line ?? this.line,
        station: station ?? this.station,
      );

  SystemSelectState setSystem(String system) => SystemSelectState(
        system: system,
        line: null,
        station: null,
      );

  SystemSelectState setLine(String line) => SystemSelectState(
        system: this.system,
        line: line,
        station: null,
      );

  SystemSelectState setStation(String station) => SystemSelectState(
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

class SystemsListCubit extends Cubit<List<dynamic>> with EquatableMixin {
  SystemsListCubit() : super([]);
  @override
  List<Object> get props => [state];
  @override
  bool get stringify => true;

  loadSystems() {
    graphQLClient.value
        .query(
      QueryOptions(
        documentNode: gql(
          """
            query {
              systems {
                name
                id
              }
            }
        """,
        ),
      ),
    )
        .then((value) {
      final systems = (value.data["systems"] as Iterable).toList();
      emit(systems);
    });
  }
}

class SystemSelectCubit extends Cubit<SystemSelectState> with EquatableMixin {
  SystemSelectCubit()
      : super(SystemSelectState(
          system: null,
          line: null,
          station: null,
        ));

  void selectSystem(String system) => emit(state.setSystem(system));
  void selectLine(String line) => emit(state.setLine(line));
  void selectStation(String station) => emit(state.setStation(station));

  @override
  List<Object> get props => [state];
  @override
  bool get stringify => true;
}

class LinesListCubit extends Cubit<List<dynamic>> with EquatableMixin {
  StreamSubscription<SystemSelectState> _subscription;

  LinesListCubit(SystemSelectCubit systemSelectCubit) : super([]) {
    _subscription = systemSelectCubit.listen((newState) {
      if (newState.system != null) {
        this.loadLinesFor(newState.system);
      } else {
        emit([]);
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  @override
  List<Object> get props => [state];
  @override
  bool get stringify => true;

  loadLinesFor(String systemId) async {
    if (systemId == null) {
      return;
    }
    final value = await graphQLClient.value.query(
      QueryOptions(
        documentNode: gql(
          """
            query GetSystemLines(\$id: ID!) {
              system(id: \$id) {
                lines {
                  id
                  name
                }
              }
            }
        """,
        ),
        variables: {
          "id": systemId,
        },
      ),
    );
    final lines = (value.data["system"]["lines"] as Iterable).toList();
    emit(lines);
  }
}

class StationsListCubit extends Cubit<List<dynamic>> with EquatableMixin {
  StreamSubscription<SystemSelectState> _subscription;

  StationsListCubit(SystemSelectCubit systemSelectCubit) : super([]) {
    _subscription = systemSelectCubit.listen((newState) {
      if (newState.line != null) {
        this.loadStationsFor(newState.line);
      } else {
        emit([]);
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  @override
  List<Object> get props => [state];
  @override
  bool get stringify => true;

  loadStationsFor(String lineId) async {
    if (lineId == null) {
      return;
    }
    final value = await graphQLClient.value.query(
      QueryOptions(
        documentNode: gql(
          """
              query GetLineStations(\$id: ID!) {
                line(id: \$id) {
                  stations {
                    name
                    id
                  }
                }
              }
        """,
        ),
        variables: {
          "id": lineId,
        },
      ),
    );
    final lines = (value.data["line"]["stations"] as Iterable).toList();
    emit(lines);
  }
}
