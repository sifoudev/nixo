import 'package:flutter/material.dart';

class AppColors {
  static Color system = HexColor.fromHex("#111133");
  static Color primary = HexColor.fromHex("#62E2FF");
  static Color secondary = HexColor.fromHex("#D8A3FF");
  static Color mistakes = HexColor.fromHex("#FF4958");
  static Color success = HexColor.fromHex("#B0D538");


  static Color black = HexColor.fromHex("#000000");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color hint = Colors.grey;

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
