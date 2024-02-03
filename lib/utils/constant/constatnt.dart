import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  static Color white = Colors.white;
  static Color black = Colors.black;

  static TextStyle myStyle(
          {Color color = Colors.black,
          double fontsize = 16,
          FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.lato(
          fontSize: fontsize, color: color, fontWeight: fontWeight);
}
