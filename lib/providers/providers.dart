import 'package:dovy/general.dart';
import './auth.dart';
export './auth.dart';

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
    final graphQLClient = ref.watch(graphQlProvider);
    final value = await graphQLClient.query(
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
    final graphQLClient = ref.watch(graphQlProvider);

    final systemId = ref.watch(systemSelectProvider).state.system;

    if (systemId == null) {
      return [];
    }

    final value = await graphQLClient.query(
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
    final graphQLClient = ref.watch(graphQlProvider);

    final lineId = ref.watch(systemSelectProvider).state.line;

    if (lineId == null) {
      return [];
    }

    final value = await graphQLClient.query(
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

final routerProvider = Provider<FluroRouter>(
  (ref) {
    final router = FluroRouter()
      ..define(
        '/',
        handler: Handler(
          handlerFunc: (context, parameters) => MainScreen(),
        ),
      )
      ..define(
        '/login',
        handler: Handler(
          handlerFunc: (context, parameters) => LoginScreen(),
        ),
      )
      ..define(
        '/home',
        handler: Handler(
          handlerFunc: (context, parameters) => HomeScreen(),
        ),
      )
      ..notFoundHandler = Handler(
        handlerFunc: (context, parameters) => NotFoundScreen(),
      );

    return router;
  },
);

final graphQlProvider = Provider<GraphQLClient>(
  (ref) {
    final authService = ref.watch(authServiceProvider);
    final token = ref.watch(authTokenProvider)?.data?.value;

    if (token == null || authService == null) {
      return null;
    }

    final HttpLink httpLink = HttpLink(
      uri: 'https://xantiagoma.herokuapp.com/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async {
        return 'Bearer $token';
      },
    );

    final Link link = authLink.concat(httpLink);

    final graphQLClient = GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    );

    return graphQLClient;
  },
);

final locationDataProvider =
    FutureProvider.autoDispose.family<Map<String, dynamic>, LatLng>(
  (ref, point) async {
    return await LocationService.getLocation(point);
  },
);

final ipDataProvider = FutureProvider<Map<String, dynamic>>(
  (ref) async {
    return await LocationService.getIpInfo();
  },
);

final strapiServiceProvider = Provider<Strapi>(
  (ref) {
    final token = ref.watch(authTokenProvider)?.data?.value;
    final baseUrl = 'https://xantiagoma.herokuapp.com';
    return Strapi.newClient()
      ..initialize(
        base_url: baseUrl,
        token: token ?? '',
      );
  },
);

final configsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final strapiService = ref.watch(strapiServiceProvider);
  final response = await strapiService.http.get('/configs');
  final configs = response.data;
  return configs;
});

final stationsProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final strapiService = ref.watch(strapiServiceProvider);
  final stations =
      (await strapiService.find('stations')).map((e) => e.data).toList();
  return stations;
});

final linesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final strapiService = ref.watch(strapiServiceProvider);
  final stations =
      (await strapiService.find('stations')).map((e) => e.data).toList();
  return stations;
});
