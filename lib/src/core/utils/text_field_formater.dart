import 'package:flutter/services.dart';

class ArabicToEnglishNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Convert Arabic numerals (٠-٩) to English numerals (0-9)
    String newText = newValue.text.replaceAllMapped(RegExp(r'[٠١٢٣٤٥٦٧٨٩]'),
        (match) => (match.group(0)!.codeUnitAt(0) - 0x0660).toString());

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
