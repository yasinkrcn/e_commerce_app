extension StringExtensions on String? {
  String get getValueOrDefault {
    return this ?? "";
  }

  bool isEqualsLength(int length) {
    return getValueOrDefault.length == length;
  }

  String get formatWithDots {
    return getValueOrDefault.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match.group(1)}.',
    );
  }

  String get decodePhoneFormat {
    RegExp pattern = RegExp(r'[\D]');
    return getValueOrDefault.replaceAll(pattern, "");
  }

  bool get nullableIsNotEmpty => getValueOrDefault.isNotEmpty;
  bool get nullableIsEmpty => !nullableIsNotEmpty;
}
