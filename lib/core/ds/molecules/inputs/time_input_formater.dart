import 'package:flutter/services.dart';

class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = '';
    String currentValue = newValue.text;
    formattedText = _formatDate(_extractNumbers(currentValue));

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.fromPosition(
          TextPosition(offset: formattedText.length)),
    );
  }

  String _extractNumbers(String text) {
    return text.replaceAll(RegExp(r'\D'), '');
  }

  String _formatDate(String numbers) {
    if (numbers.length <= 2) {
      return numbers;
    } else if (numbers.length <= 4) {
      return '${numbers.substring(0, 2)}:${numbers.substring(2)}';
    } else {
      return '${numbers.substring(0, 2)}:${numbers.substring(2, 4)}';
    }
  }
}
