import 'package:dovy/general.dart';

final localStorageProvider = FutureProvider<HiveInterface>(
  (ref) async {
    await Hive.initFlutter();
    return Hive;
  },
);

final authBoxProvider = FutureProvider<Box<String>>(
  (ref) async {
    final res = ref.watch(localStorageProvider);

    if (res?.data?.value == null) {
      return null;
    }

    final store = res?.data?.value;
    final box = await store.openBox<String>('auth_box');
    return box;
  },
);

final authTokenProvider = StreamProvider<String>(
  (ref) async* {
    final authBox = ref.watch(authBoxProvider)?.data?.value;

    if (authBox != null) {
      yield authBox.get('jwt');
      final stream = authBox.watch(key: 'jwt');
      await for (final event in stream) {
        yield event.value;
      }
      // ref.onDispose(() => stream.);
    }
  },
);

final authServiceProvider = Provider<AuthService>(
  (ref) {
    final box = ref.watch(authBoxProvider)?.data?.value;
    final strapi = ref.watch(strapiServiceProvider);

    if (box == null) {
      return null;
    }

    if (strapi == null) {
      return null;
    }

    return AuthService(
      strapi: strapi,
      box: box,
    );
  },
);

final userProvider = FutureProvider<Map<String, dynamic>>(
  (ref) async {
    final jwt = ref.watch(authTokenProvider)?.data?.value;
    final strapi = ref.watch(strapiServiceProvider);

    if (jwt == null || strapi == null) {
      return null;
    }

    try {
      final response = await strapi.http.get("/users/me");
      return response.data;
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
