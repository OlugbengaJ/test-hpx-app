import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xff434afa);
  static Color secondary = const Color(0xff434afa);
  static Color dark = const Color(0xff434afa);
  static Color white = const Color(0xff434afa);
  static Color tertiary = const Color(0xff434afa);
  static Color danger = const Color(0xFFFA4343);
  static Color success = const Color(0xff434afa);

  static int blackPrimaryValue = 0xFF000000;
  static MaterialColor primaryBlack = MaterialColor(
    blackPrimaryValue,
    <int, Color>{
      50: const Color(0xFF000000),
      100: const Color(0xFF000000),
      200: const Color(0xFF000000),
      300: const Color(0xFF000000),
      400: const Color(0xFF000000),
      500: Color(blackPrimaryValue),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
