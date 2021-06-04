import 'dart:convert';
import 'dart:typed_data';

import 'package:dovy/general.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
