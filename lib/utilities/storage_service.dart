import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  static final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));


  
  static Future set(String key, String? value) async {
    await storage.write(key: key, value: value);
  }

  static Future get(String key) async {
    return await storage.read(key: key) ?? "";
  }
}