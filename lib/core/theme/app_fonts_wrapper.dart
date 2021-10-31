import 'package:flutter/material.dart';

class AppFontsWrapper {
  static Widget textMedium(String text, double size, Color color) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500),
    );
  }

  static Widget textBold(String text, double size, Color color) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700),
    );
  }
}
