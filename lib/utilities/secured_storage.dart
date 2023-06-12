import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage();
  
  // Create storage
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future set(String key, String? value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> get(String key) async {
    return await storage.read(key: key) ?? "";
  }
}
