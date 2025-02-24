import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension ColorUtils on Color {
  /// Darken the color by [amount] (0.0 to 1.0)
  Color darken(double amount) {
    assert(amount >= 0 && amount <= 1);
    final factor = 1 - amount;
    return Color.fromARGB(
      a.toInt(),
      (r * factor).clamp(0, 100).toInt(),
      (g * factor).clamp(0, 100).toInt(),
      (b * factor).clamp(0, 100).toInt(),
    );
  }
}
