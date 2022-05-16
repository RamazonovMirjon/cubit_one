import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._init();
  static StorageService get instance => _instance;
  StorageService._init();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future writes(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  Future reads(String key) async {
    var a = await storage.read(key: key);
    return a.toString();
  }

  Future delete(String key) async {
    await storage.delete(key: key);
  }
}
