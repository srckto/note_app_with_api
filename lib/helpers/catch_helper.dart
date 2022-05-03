import 'package:get_storage/get_storage.dart';

class CatchHelper {
  CatchHelper._privateConstructor();

  static final CatchHelper instance = CatchHelper._privateConstructor();

  final _storage = GetStorage();

  Future<void> save(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  dynamic get(String key) {
    return _storage.read(key);
  }

  Future<void> remove(String key) async {
    await _storage.remove(key);
  }
}
