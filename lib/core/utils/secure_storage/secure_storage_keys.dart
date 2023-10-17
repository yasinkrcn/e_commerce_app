// ignore_for_file: constant_identifier_names

enum SecureStorageKeys {
  EXAMPLE,
  FAVORITES_INFO,
}

extension SecureStorageKeysExtension on SecureStorageKeys {
  String sharedKeyStateToKeyValues() {
    switch (this) {
      case SecureStorageKeys.EXAMPLE:
        return "EXAMPLE";
      case SecureStorageKeys.FAVORITES_INFO:
        return "FAVORITES_INFO";
    }
  }
}
