import 'package:dovy/general.dart';
import 'package:flutter/foundation.dart';
export './auth.dart';
export './local.dart';

final selectSystemProvider = StateProvider<int?>(
  (ref) => null,
);

final selectLineProvider = StateProvider<int?>(
  (ref) => null,
);

final selectStationProvider = StateProvider<int?>(
  (ref) => null,
);

final positionProvider = StateProvider<MapPosition?>(
  (ref) => null,
);

final routerProvider = Provider<FluroRouter>(
  (ref) {
    final router = FluroRouter()
      ..define(
        '/',
        handler: Handler(
          handlerFunc: (context, parameters) => HomeScreen(),
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
      ..define(
        '/line/:id',
        handler: Handler(
          handlerFunc: (context, parameters) {
            // final args = context.settings.arguments as MyArgumentsDataClass;
            final id = parameters["id"]?[0].toInt();
            if (id == null) {
              throw ArgumentError("Invalid id");
            }

            return LineScreen(id: id);
          },
        ),
      )
      ..define(
        '/station/:id',
        handler: Handler(
          handlerFunc: (context, parameters) {
            // final args = context.settings.arguments as MyArgumentsDataClass;
            final id = parameters["id"]?[0].toInt();
            if (id != null) {
              return StationScreen(id: id); // TODO
            }
          },
        ),
      )
      ..notFoundHandler = Handler(
        handlerFunc: (context, parameters) => NotFoundScreen(),
      );

    return router;
  },
);

final locationDataProvider =
    AutoDisposeFutureProviderFamily<AddressDetails, LatLng>(
  (ref, point) async {
    return await LocationService.getLocation(point);
  },
);

final ipDataProvider = FutureProvider<IPData?>(
  (ref) async {
    if (kIsWeb) {
      return null;
    }
    return await LocationService.getIpInfo();
  },
);

final strapiClientProvider = Provider<Strapi>(
  (ref) {
    final token = ref.watch(authTokenProvider).asData?.value;
    return Strapi(
      Constants.baseUrl,
      token: token ?? Constants.publicToken,
    );
  },
);

final systemsProvider = FutureProvider<List<Map<String, dynamic>>?>(
  (ref) async {
    final client = ref.watch(strapiClientProvider);

    final response = await client.collection.get('systems');
    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);

final linesProvider = FutureProvider<List<Map<String, dynamic>>?>(
  (ref) async {
    final client = ref.watch(strapiClientProvider);
    final system = ref.watch(selectSystemProvider);
    final line = ref.watch(selectLineProvider);

    final response = (await client.collection.get(
      'lines',
      queryParameters: {
        'pagination[pageSize]': 100,
        'populate': 'stations',
        'filters[systems][id]': system,
        if (line != null) 'id': line,
      },
    ));

    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);

final stationsProvider = FutureProvider<List<Map<String, dynamic>>?>(
  (ref) async {
    // final line = ref.watch(selectLineProvider);
    final system = ref.watch(selectSystemProvider);
    final strapiService = ref.watch(strapiClientProvider);

    final response = await strapiService.collection.get(
      'stations',
      queryParameters: {
        'populate': 'lines',
        // populate[lines][populate]: 'systems',
        r'filters[lines][systems][id][$eq]': system,
        // TODO: Check this
        'pagination[pageSize]': 200,
        // if (line != null) 'lines.id': line,
        // if (line == null) 'lines.system.id': system,
      },
    );

    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);

final systemProvider =
    AutoDisposeFutureProviderFamily<Map<String, dynamic>?, int?>(
  (ref, id) async {
    if (id == null) {
      return null;
    }

    final client = ref.watch(strapiClientProvider);

    final response = await client.collection.getOne('systems', id);

    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);

final lineProvider =
    AutoDisposeFutureProviderFamily<Map<String, dynamic>?, int?>(
  (ref, id) async {
    if (id == null) {
      return null;
    }

    final client = ref.watch(strapiClientProvider);
    final response = await client.collection.getOne(
      'lines',
      id,
      queryParameters: {
        'populate': 'stations',
      },
    );
    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);

final stationProvider =
    AutoDisposeFutureProviderFamily<Map<String, dynamic>?, int?>(
  (ref, id) async {
    if (id == null) {
      return null;
    }
    final client = ref.watch(strapiClientProvider);
    final response = await client.collection.getOne(
      'stations',
      id,
      queryParameters: {
        'populate': 'lines',
      },
    );

    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);

final mapControllerProvider = StateProvider<MapController?>(
  (ref) {
    return null;
  },
);

final stationsSearchProvider =
    AutoDisposeFutureProviderFamily<List<Map<String, dynamic>>?, String?>(
  (ref, q) async {
    final system = ref.watch(selectSystemProvider);
    final client = ref.watch(strapiClientProvider);

    if (q == null) {
      return [];
    }
    if (q == '') {
      return [];
    }

    if (q.trim().isEmpty) {
      return [];
    }

    final response = await client.collection.get(
      'stations',
      queryParameters: {
        '_q': q.trim(),
        'lines.system.id': system,
      },
    );

    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);

final linesSearchProvider =
    AutoDisposeFutureProviderFamily<List<Map<String, dynamic>>?, String?>(
  (ref, q) async {
    final system = ref.watch(selectSystemProvider);
    final client = ref.watch(strapiClientProvider);

    if (q == null) {
      return [];
    }
    if (q == '') {
      return [];
    }

    if (q.trim().isEmpty) {
      return [];
    }

    final response = await client.collection.get(
      'lines',
      queryParameters: {
        '_q': q.trim(),
        'filters[systems][id]': system,
        'pagination[pageSize]': 100,
      },
    );

    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);
