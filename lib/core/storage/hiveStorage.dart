// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HiveStorage implements IPersistStore {
  late Box _box;
  final String? name;
  HiveStorage({
    this.name,
  });
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(name ?? 'DEFAULT');
  }

  @override
  Object? read(String k) => _box.get(k);
  @override
  Future<void> write<T>(String k, T v) async => _box.put(k, v);
  @override
  Future<void> delete(String k) async => _box.delete(k);
  @override
  Future<void> deleteAll() async => await _box.clear();
}
