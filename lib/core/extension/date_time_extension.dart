extension DateTimeExtension on DateTime {
  String profileCommentDate() {
    final List<String> days = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'];
    final List<String> months = [
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayıs',
      'Haziran',
      'Temmuz',
      'Ağustos',
      'Eylül',
      'Ekim',
      'Kasım',
      'Aralık'
    ];

    final day = this.day;
    final month = this.month;
    final year = this.year;
    final dayName = days[this.weekday - 1];

    return '$day ${months[month - 1]} $year, $dayName';
  }
}
