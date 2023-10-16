// ignore_for_file: constant_identifier_names

enum SecureStorageKeys {
  EXAMPLE,
  CACHE_USER_INFO,
}

extension SecureStorageKeysExtension on SecureStorageKeys {
  String sharedKeyStateToKeyValues() {
    switch (this) {
      case SecureStorageKeys.EXAMPLE:
        return "EXAMPLE";
      case SecureStorageKeys.CACHE_USER_INFO:
        return "CACHE_USER_INFO";
    }
  }
}
