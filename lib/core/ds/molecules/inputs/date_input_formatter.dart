import 'package:flutter/services.dart';

class DateInputFormatter implements TextInputFormatter {
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
    if (numbers.length <= 4) {
      return numbers;
    } else if (numbers.length <= 6) {
      return '${numbers.substring(0, 4)}-${numbers.substring(4)}';
    } else if (numbers.length <= 8) {
      return '${numbers.substring(0, 4)}-${numbers.substring(4, 6)}-${numbers.substring(6)}';
    } else {
      return '${numbers.substring(0, 4)}-${numbers.substring(4, 6)}-${numbers.substring(6, 8)}';
    }
  }
}
