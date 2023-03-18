import 'package:flutter/material.dart';

//App Main ThemeData
ThemeData themeData = ThemeData(
  primarySwatch: kPrimaryColor,
);

//Main Colors Application
const kPrimary = Color.fromRGBO(32, 37, 66, 1);
MaterialColor kPrimaryColor = MaterialColor(0xFF202542, color);

Map<int, Color> color = {
  50: kPrimary,
  100: const Color(0xFF202542),
  200: const Color(0xFF1d213b),
  300: const Color(0xFF1a1e35),
  400: const Color(0xFF161a2e),
  500: const Color(0xFF131628),
  600: const Color(0xFF101321),
  700: const Color(0xFF0d0f1a),
  800: const Color(0xFF0a0b14),
  900: const Color(0xFF06070d),
};
