import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  static const String _settingsBox = 'settings';
  
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_settingsBox);
  }

  static Future<void> setValue(String key, dynamic value) async {
    final box = Hive.box(_settingsBox);
    await box.put(key, value);
  }

  static dynamic getValue(String key, {dynamic defaultValue}) {
    final box = Hive.box(_settingsBox);
    return box.get(key, defaultValue: defaultValue);
  }

  static Future<void> removeValue(String key) async {
    final box = Hive.box(_settingsBox);
    await box.delete(key);
  }

  static Future<void> clearAll() async {
    final box = Hive.box(_settingsBox);
    await box.clear();
  }
}
