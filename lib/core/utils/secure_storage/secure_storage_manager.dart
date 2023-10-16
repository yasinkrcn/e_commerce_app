import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:e_commerce_app/core/utils/secure_storage/secure_storage_keys.dart';

class SecureStorageManager {
  static final SecureStorageManager _instance = SecureStorageManager._();

  factory SecureStorageManager() => _instance;

  SecureStorageManager._();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Verileri kaydet
  Future<void> write(SecureStorageKeys key, String value) async {
    await _secureStorage.write(key: key.sharedKeyStateToKeyValues(), value: value);
  }

  // Verileri oku
  Future<dynamic> read<T>(SecureStorageKeys key) async {
    return await _secureStorage.read(key: key.sharedKeyStateToKeyValues());
  }

  // Verileri sil
  Future<void> delete(SecureStorageKeys key) async {
    await _secureStorage.delete(key: key.sharedKeyStateToKeyValues());
  }
}
