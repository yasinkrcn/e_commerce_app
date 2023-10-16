extension CustomTimeFormat on int {
  String toCustomTimeFormat() {
    // Dakika ve saniye değerlerini hesapla
    int minutes = this ~/ 60;
    int seconds = this % 60;

    // Dakika ve saniye değerlerini iki haneli bir dizeye dönüştür
    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = seconds.toString().padLeft(2, '0');

    // Sonuç dizesini oluştur ve döndür
    return '$minutesString:$secondsString';
  }
}
