import 'package:e_commerce_app/core/_core_exports.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = _formatPhoneNumber(newValue.text);
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _formatPhoneNumber(String text) {
    text = text.replaceAll(RegExp(r'[^0-9]'), ''); // Sadece rakamları alın

    if (text.length <= 3) {
      return text;
    } else if (text.length <= 6) {
      return '${text.substring(0, 3)} ${text.substring(3)}';
    } else if (text.length <= 10) {
      return '${text.substring(0, 3)} ${text.substring(3, 6)} ${text.substring(6)}';
    } else {
      return '${text.substring(0, 3)} ${text.substring(3, 6)} ${text.substring(6, 10)}';
    }
  }
}
