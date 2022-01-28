import 'package:dovy/general.dart';

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
    final strapi = ref.watch(strapiClientProvider);

    if (box == null) {
      return null;
    }

    return AuthService(
      strapi: strapi,
      box: box,
    );
  },
);

final userProvider = FutureProvider<dynamic>(
  (ref) async {
    final jwt = ref.watch(authTokenProvider).asData?.value;
    final strapi = ref.watch(strapiClientProvider);

    if (jwt == null) {
      return null;
    }

    try {
      final response = await strapi.http.get("/api/users/me");
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
