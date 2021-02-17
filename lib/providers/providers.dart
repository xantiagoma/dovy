import 'package:dovy/general.dart';
import 'package:dovy/graphql.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final positionProvider = StateProvider<MapPosition>(
  (ref) => null,
);

final systemSelectProvider = StateProvider<SelectState>(
  (ref) => SelectState(
    system: null,
    line: null,
    station: null,
  ),
);

final systemsListProvider = FutureProvider<List>(
  (ref) async {
    final value = await graphQLClient.value.query(
      QueryOptions(
        documentNode: gql(
          """
            query {
              systems {
                name
                id
                lines {
                  id
                }
              }
            }
        """,
        ),
      ),
    );
    final systems = (value.data["systems"] as Iterable).toList();
    return systems;
  },
);

final linesListProvider = FutureProvider<List>(
  (ref) async {
    final systemId = ref.watch(systemSelectProvider).state.system;

    if (systemId == null) {
      return [];
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
                  color
                  shape
                  stations {
                    id
                    name
                    location {
                      latitude
                      longitude
                    }
                    lines {
                      id
                    }
                  }
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
    return lines;
  },
);

final stationsListProvider = FutureProvider<List>(
  (ref) async {
    final lineId = ref.watch(systemSelectProvider).state.line;

    if (lineId == null) {
      return [];
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
    return lines;
  },
);
