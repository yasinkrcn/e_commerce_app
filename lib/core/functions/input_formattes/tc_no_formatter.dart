import 'package:flutter/services.dart';

class TcNoFormatter extends TextInputFormatter {
  static const int maxLength = 11; // Maksimum uzunluk

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = _formatText(newValue.text);
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _formatText(String text) {
    text = text.replaceAll(RegExp(r'[^0-9]'), ''); // Sadece rakamları alın

    // Metin 11 karakterden uzunsa, sadece ilk 11 karakteri alın
    if (text.length > maxLength) {
      text = text.substring(0, maxLength);
    }

    return text;
  }
}
