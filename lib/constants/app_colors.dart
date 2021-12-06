import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Color(0xff001bff);
  static const Color yellow = Color(0xffffff00);
  static const Color grey = Color(0xfff0f0f0);
  static const Color scienceBlue = Color(0xff0074e4);

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
