import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static Color backgroundColor = Colors.indigo.withAlpha(50);
  static Color textColor = Colors.white;
  static TextStyle header = GoogleFonts.lobster(
      fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white);
  static TextStyle countryText =
      const TextStyle(fontSize: 18, color: Colors.white);
  static TextStyle capitalText =
      const TextStyle(fontSize: 18, color: Colors.grey);
  static TextStyle mainText = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white);
  static MaterialColor whiteSwatch = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
}
