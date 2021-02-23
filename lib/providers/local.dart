import 'dart:convert';
import 'dart:typed_data';

import 'package:dovy/general.dart';

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

final encryptionKeyProvider = FutureProvider<Uint8List>(
  (ref) async {
    final secureStorage = ref.watch(localSecureStorageProvider);
    final containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    final encryptionKey =
        base64Url.decode(await secureStorage.read(key: 'key'));
    return encryptionKey;
  },
);
