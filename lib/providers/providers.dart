import 'package:dovy/general.dart';
import './auth.dart';
export './auth.dart';
export './local.dart';

final positionProvider = StateProvider<MapPosition?>(
  (ref) => null,
);

final selectProvider = StateProvider<SelectState>(
  (ref) => SelectState(
    system: null,
    line: null,
    station: null,
  ),
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
            return LineScreen(id: parameters["id"]![0]); // TODO
          },
        ),
      )
      ..define(
        '/station/:id',
        handler: Handler(
          handlerFunc: (context, parameters) {
            // final args = context.settings.arguments as MyArgumentsDataClass;
            return StationScreen(id: parameters["id"]![0]); // TODO
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
    FutureProvider.autoDispose.family<AddressDetails, LatLng>(
  (ref, point) async {
    return await LocationService.getLocation(point);
  },
);

final ipDataProvider = FutureProvider<IPData>(
  (ref) async {
    return await LocationService.getIpInfo();
  },
);

final strapiServiceProvider = Provider<Strapi>(
  (ref) {
    final token = ref.watch(authTokenProvider).data?.value;
    final baseUrl = 'https://xantiagoma.herokuapp.com';
    return Strapi(
      baseUrl,
      token: token,
    );
  },
);

final configsProvider = FutureProvider<Map<String, dynamic>?>(
  (ref) async {
    final strapiService = ref.watch(strapiServiceProvider);
    final response = (await strapiService.getPage('configs')).maybeWhen(
      orElse: () => null,
      ok: (r) => r as Map<String, dynamic>,
    );
    return response;
  },
);

final systemsProvider = FutureProvider<List<System>?>(
  (ref) async {
    final strapiService = ref.watch(strapiServiceProvider);
    final response = (await strapiService.find('systems')).maybeWhen(
      orElse: () => null,
      ok: (r) => r,
    );

    if (response == null) {
      return null;
    }

    final systems = response
        .map((e) => System.fromJson(e.data as Map<String, dynamic>))
        .toList();

    return systems;
  },
);

final linesProvider = FutureProvider<List<Line>?>(
  (ref) async {
    final select = ref.watch(selectProvider).state;
    final strapiService = ref.watch(strapiServiceProvider);

    final response = (await strapiService.find(
      'lines',
      queryParameters: {
        'system.id': select.system,
        if (select.line != null) 'id': select.line,
      },
    ))
        .maybeWhen(
      orElse: () => null,
      ok: (l) => l,
    );

    if (response == null) {
      return null;
    }

    final lines = response
        .map((e) => Line.fromJson(e.data as Map<String, dynamic>))
        .toList();

    return lines;
  },
);

final stationsProvider = FutureProvider<List<Station>?>(
  (ref) async {
    final select = ref.watch(selectProvider).state;
    final strapiService = ref.watch(strapiServiceProvider);

    final response = (await strapiService.find(
      'stations',
      queryParameters: {
        if (select.line != null) 'lines.id': select.line ?? '',
        if (select.line == null) 'lines.system.id': select.system ?? '',
      },
    ))
        .maybeWhen(
      orElse: () => null,
      ok: (l) => l,
    );

    if (response == null) {
      return null;
    }

    final stations = response
        .map((e) => Station.fromJson(e.data as Map<String, dynamic>))
        .toList();

    return stations;
  },
);

final systemProvider = FutureProvider.autoDispose.family<System?, String?>(
  (ref, id) async {
    if (id == null) {
      return null;
    }

    final strapiService = ref.watch(strapiServiceProvider);

    final response = (await strapiService.findOne('systems', id)).maybeWhen(
      orElse: () => null,
      ok: (r) => r,
    );

    if (response == null) {
      return null;
    }

    return System.fromJson(response.data as Map<String, dynamic>);
  },
);

final lineProvider = FutureProvider.autoDispose.family<Line?, String?>(
  (ref, id) async {
    if (id == null) {
      return null;
    }

    final strapiService = ref.watch(strapiServiceProvider);
    final response = (await strapiService.findOne('lines', id)).maybeWhen(
      orElse: () => null,
      ok: (r) => r,
    );

    if (response == null) {
      return null;
    }

    return Line.fromJson(response.data as Map<String, dynamic>);
  },
);

final stationProvider = FutureProvider.autoDispose.family<Station?, String?>(
  (ref, id) async {
    if (id == null) {
      return null;
    }
    final strapiService = ref.watch(strapiServiceProvider);
    final response = (await strapiService.findOne('stations', id)).maybeWhen(
      orElse: () => null,
      ok: (r) => r,
    );

    if (response == null) {
      return null;
    }

    return Station.fromJson(response.data as Map<String, dynamic>);
  },
);

final mapControllerProvider = Provider<MapController>(
  (ref) {
    return MapController();
  },
);

final stationsSearchProvider =
    FutureProvider.autoDispose.family<List<Station>?, String?>(
  (ref, q) async {
    final select = ref.watch(selectProvider).state;

    if (q == null) {
      return [];
    }
    if (q == '') {
      return [];
    }
    if (!(q is String)) {
      return [];
    }
    if (q.trim().isEmpty) {
      return [];
    }

    final strapiService = ref.watch(strapiServiceProvider);
    final response = (await strapiService.find(
      'stations',
      queryParameters: {
        '_q': q.trim(),
        'lines.system.id': select.system ?? '',
      },
    ))
        .maybeWhen(
      orElse: () => null,
      ok: (r) => r,
    );

    if (response == null) {
      return null;
    }

    final list = response
        .map(
          (e) => Station.fromJson(e.data as Map<String, dynamic>),
        )
        .toList();

    return list;
  },
);

final linesSearchProvider =
    FutureProvider.autoDispose.family<List<Line>?, String?>(
  (ref, q) async {
    final select = ref.watch(selectProvider).state;

    if (q == null) {
      return [];
    }
    if (q == '') {
      return [];
    }
    if (!(q is String)) {
      return [];
    }
    if (q.trim().isEmpty) {
      return [];
    }

    final strapiService = ref.watch(strapiServiceProvider);
    final response = (await strapiService.find(
      'lines',
      queryParameters: {
        'system.id': select.system,
        '_q': q.trim(),
      },
    ))
        .maybeWhen(
      orElse: () => null,
      ok: (r) => r,
    );

    if (response == null) {
      return null;
    }

    final list = response
        .map(
          (e) => Line.fromJson(e.data as Map<String, dynamic>),
        )
        .toList();

    return list;
  },
);
