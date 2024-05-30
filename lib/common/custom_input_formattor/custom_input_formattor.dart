import 'package:flutter/services.dart';

class CountryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final text = newValue.text;

    // Allow + only at the first position
    if (text.length == 1 && text != '+') {
      return oldValue;
    }

    // Allow numbers after +
    if (text.length > 1 && !RegExp(r'^\+\d*$').hasMatch(text)) {
      return oldValue;
    }

    // Set max length to 4
    if (text.length > 4) {
      return oldValue;
    }

    return newValue;
  }
}
