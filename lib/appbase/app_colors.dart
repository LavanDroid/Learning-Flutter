import 'package:flutter/material.dart';

class AppColors {
  Color mBlue = const Color(0xff001bff);
  Color mYellow = const Color(0xffffff00);

  // ? If you wish to use ARGB format
  // Color color1 = HexColor("#ff0fff");
  // Color color2 = HexColor("#8030ff00");
}

/* class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
} */
