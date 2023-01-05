// ignore_for_file: annotate_overrides, file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SharedPreferencesStore implements IPersistStore {
  late SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Object? read(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> write<T>(String key, T value) async {
    await _prefs.setString(key, value as String);
  }

  @override
  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    await _prefs.clear();
  }
}
