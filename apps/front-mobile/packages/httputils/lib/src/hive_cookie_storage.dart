import 'package:cookie_jar/cookie_jar.dart';
import 'package:hive/hive.dart';

class HiveCookieStorage extends Storage {
  HiveCookieStorage(this.path);

  static const String storageId = "hive_cookie_storage";

  final String? path;

  // Not implemented
  bool? persistSession = false;

  bool ignoreExpires = false;

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {
    this.persistSession = persistSession;
    this.ignoreExpires = ignoreExpires;
    if (path != null) {
      Hive.init(path);
    }
  }

  @override
  Future<void> delete(String key) async {
    (await openBox()).delete(key);
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    (await openBox()).deleteAll(keys);
  }

  @override
  Future<String?> read(String key) async {
    return (await openBox()).get(key);
  }

  @override
  Future<void> write(String key, String value) async {
    (await openBox()).put(key, value);
  }

  Future<Box<String>> openBox() async {
    return await Hive.openBox<String>(storageId);
  }
}
