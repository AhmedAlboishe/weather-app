import 'package:flutter/material.dart';

// const Color white = Colors.white;
// const Color black = Colors.black;
const Color backgroundClr = Color(0xff211D1A);
const Color textClr = Color(0xffFAE5D4);
const Color iconClr = Color(0xffFFB38F);
const Color primaryClr = Color(0xffF55313);
const Color dialogClr = Color(0xffFFE4CF);
const Color containerClr = Color(0xff272320);
const Color containerPClr = Color(0xff332927);

class Themes {
  static final dark = ThemeData(
    useMaterial3: true,
    primaryColor: backgroundClr,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: iconClr,
      onPrimary: Colors.white,
      secondary: iconClr,
      onSecondary: iconClr,
      error: Colors.red,
      onError: Colors.orange,
      surface: backgroundClr,
      onSurface: textClr,
    ),
    splashColor: iconClr.withOpacity(0.1),
    hoverColor: Colors.transparent,
    highlightColor: iconClr.withOpacity(0.1),
    fontFamily: 'Tebian',
    iconTheme: const IconThemeData(color: iconClr),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(iconClr),
      ),
    ),
  );
}
