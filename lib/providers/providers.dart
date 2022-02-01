import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dovy/general.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// LOCAL
final localStorageProvider = FutureProvider<HiveInterface>(
  (ref) async {
    await Hive.initFlutter();
    return Hive;
  },
);

final localSecureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) {
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    return secureStorage;
  },
);

final encryptionKeyProvider = FutureProvider<Uint8List?>(
  (ref) async {
    final secureStorage = ref.watch(localSecureStorageProvider);

    // START WEB
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('key')) {
        final key = Hive.generateSecureKey();
        await prefs.setString('key', base64UrlEncode(key));
      }

      final key = prefs.getString('key');

      if (key == null) {
        return null;
      }

      final encryptionKey = base64Url.decode(key);
      return encryptionKey;
    }
    // END WEB

    final containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    final key = await secureStorage.read(key: 'key');
    if (key == null) {
      return null;
    }
    final encryptionKey = base64Url.decode(key);
    return encryptionKey;
  },
);

// AUTH

final authBoxProvider = FutureProvider<Box<String>?>(
  (ref) async {
    final store = ref.watch(localStorageProvider).asData?.value;
    final encryptionKey = ref.watch(encryptionKeyProvider).asData?.value;

    if (store == null || encryptionKey == null) {
      return null;
    }

    final box = await store.openBox<String>(
      'authBox',
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
    return box;
  },
);

final authTokenProvider = StreamProvider<String?>(
  (ref) async* {
    final authBox = ref.watch(authBoxProvider).asData?.value;

    if (authBox != null) {
      yield authBox.get('jwt');
      final stream = authBox.watch(key: 'jwt');
      await for (final event in stream) {
        yield event.value as String;
      }
      // ref.onDispose(() => stream.);
    }

    yield null;
  },
);

final authServiceProvider = Provider<AuthService?>(
  (ref) {
    final box = ref.watch(authBoxProvider).asData?.value;
    final strapi = ref.watch(strapiPublicClientProvider);

    if (box == null) {
      return null;
    }

    return AuthService(
      strapi: strapi,
      box: box,
    );
  },
);

final userProvider = FutureProvider<Map<String, dynamic>?>(
  (ref) async {
    final jwt = ref.watch(authTokenProvider).asData?.value;
    final authBox = ref.watch(authServiceProvider);

    if (jwt == null) {
      return null;
    }

    try {
      final response = await Strapi(
        Constants.baseUrl,
        token: jwt,
      ).http.get("/api/users/me");
      return response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        authBox?.logout();
      }
    } catch (e) {
      print("e: $e");
    }

    return null;
  },
);

final loadedProvider = Provider<bool>(
  (ref) {
    final tokenLoaded = ref.watch(authTokenProvider).when(
          data: (_) => true,
          loading: () => false,
          error: (_, _s) => true,
        );

    final userLoaded = ref.watch(userProvider).when(
          data: (_) => true,
          loading: () => false,
          error: (_, _s) => true,
        );

    return tokenLoaded && userLoaded;
  },
);

// DATA

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

final strapiPublicClientProvider = Provider<Strapi>(
  (ref) {
    return Strapi(
      Constants.baseUrl,
      token: Constants.publicToken,
    );
  },
);

final systemsProvider = FutureProvider<List<Map<String, dynamic>>?>(
  (ref) async {
    final client = ref.watch(strapiPublicClientProvider);

    final response = await client.collection.get(
      'systems',
      queryParameters: {
        'fields': [
          'name',
          'code',
        ],
      },
    );

    final data = response.item1;

    if (data == null) {
      return null;
    }

    return data;
  },
);

final linesProvider = FutureProvider<List<Map<String, dynamic>>?>(
  (ref) async {
    final client = ref.watch(strapiPublicClientProvider);
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
    final strapiService = ref.watch(strapiPublicClientProvider);

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

    final client = ref.watch(strapiPublicClientProvider);

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

    final client = ref.watch(strapiPublicClientProvider);
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
    final client = ref.watch(strapiPublicClientProvider);
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
    final client = ref.watch(strapiPublicClientProvider);

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
    final client = ref.watch(strapiPublicClientProvider);

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
