import 'package:dovy/general.dart';
import './auth.dart';
export './auth.dart';
import './local.dart';
export './local.dart';

final positionProvider = StateProvider<MapPosition>(
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
      ..define(
        '/line/:id',
        handler: Handler(
          handlerFunc: (context, parameters) {
            // final args = context.settings.arguments as MyArgumentsDataClass;
            return LineScreen(id: parameters["id"][0]);
          },
        ),
      )
      ..define(
        '/station/:id',
        handler: Handler(
          handlerFunc: (context, parameters) {
            // final args = context.settings.arguments as MyArgumentsDataClass;
            return StationScreen(id: parameters["id"][0]);
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
    final token = ref.watch(authTokenProvider)?.data?.value;
    final baseUrl = 'https://xantiagoma.herokuapp.com';
    return Strapi.newClient()
      ..initialize(
        base_url: baseUrl,
        token: token ?? '',
      );
  },
);

final configsProvider = FutureProvider<Map<String, dynamic>>(
  (ref) async {
    final strapiService = ref.watch(strapiServiceProvider);
    final response = await strapiService.http.get('/configs');
    final configs = response.data;
    return configs;
  },
);

final systemsProvider = FutureProvider<List<System>>(
  (ref) async {
    final strapiService = ref.watch(strapiServiceProvider);
    final systems = (await strapiService.find('systems'))
        .map((e) => System.fromJson(e.data))
        .toList();
    return systems;
  },
);

final linesProvider = FutureProvider<List<Line>>(
  (ref) async {
    final select = ref.watch(selectProvider).state;
    final strapiService = ref.watch(strapiServiceProvider);

    final lines = (await strapiService.find(
      'lines',
      queryParameters: {
        'system.id': select.system,
        if (select.line != null) 'id': select.line,
      },
    ))
        .map((e) => Line.fromJson(e.data))
        .toList();
    return lines;
  },
);

final stationsProvider = FutureProvider<List<Station>>(
  (ref) async {
    final select = ref.watch(selectProvider).state;
    final strapiService = ref.watch(strapiServiceProvider);

    final stations = (await strapiService.find(
      'stations',
      queryParameters: {
        if (select.line != null) 'lines.id': select.line ?? '',
        if (select.line == null) 'lines.system.id': select.system ?? '',
      },
    ))
        .map((e) => Station.fromJson(e.data))
        .toList();
    return stations;
  },
);

final systemProvider = FutureProvider.autoDispose.family<System, String>(
  (ref, id) async {
    if (id == null) {
      return null;
    }
    final strapiService = ref.watch(strapiServiceProvider);
    final data = (await strapiService.findOne('systems', id)).data;
    return System.fromJson(data);
  },
);

final lineProvider = FutureProvider.autoDispose.family<Line, String>(
  (ref, id) async {
    if (id == null) {
      return null;
    }
    final strapiService = ref.watch(strapiServiceProvider);
    final data = (await strapiService.findOne('lines', id)).data;
    return Line.fromJson(data);
  },
);

final stationProvider = FutureProvider.autoDispose.family<Station, String>(
  (ref, id) async {
    if (id == null) {
      return null;
    }
    final strapiService = ref.watch(strapiServiceProvider);
    final data = (await strapiService.findOne('stations', id)).data;
    return Station.fromJson(data);
  },
);

final mapControllerProvider = Provider<MapController>(
  (ref) {
    return MapController();
  },
);

final stationsSearchProvider =
    FutureProvider.autoDispose.family<List<Station>, String>(
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
    final data = (await strapiService.find(
      'stations',
      queryParameters: {
        '_q': q.trim(),
        'lines.system.id': select.system ?? '',
      },
    ));
    final list = data
        .map((e) => e.data)
        .map(
          (e) => Station.fromJson(e),
        )
        .toList();

    return list;
  },
);

final linesSearchProvider =
    FutureProvider.autoDispose.family<List<Line>, String>(
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
    final data = (await strapiService.find(
      'lines',
      queryParameters: {
        'system.id': select.system,
        '_q': q.trim(),
      },
    ));
    final list = data
        .map((e) => e.data)
        .map(
          (e) => Line.fromJson(e),
        )
        .toList();

    return list;
  },
);
