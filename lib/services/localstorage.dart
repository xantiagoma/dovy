import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  HiveInterface _storage;

  Future<void> init() async {
    await Hive.initFlutter();
    _storage = Hive;
  }

  HiveInterface get store => _storage;
}
