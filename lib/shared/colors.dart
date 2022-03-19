import 'package:flutter/material.dart';

class ComandaBetColors {
  const ComandaBetColors._();

  /// Primary color from Figma
  static const Color primary = Color(0xFF5200FF);
  /// Primary color light from Figma
  static const Color primaryLight = Color(0xFF9D6FFF);
  /// Primary color dark from Figma
  static const Color primaryDark = Color(0xFF411E8A);
  /// Primary color with 10% opacity color from Figma
  static final Color primaryLowOpacity = primary.withOpacity(0.1);

  /// Secondary color from Figma
  static const Color secondary = Color(0xFFCC465E);
  /// Secondary color light from Figma
  static const Color secondaryLight = Color(0xFFCC465E);
  /// Secondary color dark from Figma
  static const Color secondaryDark = Color(0xFFCC465E);
  /// Secondary color with 10% opacity color from Figma
  static final Color secondaryLowOpacity = secondary.withOpacity(0.1);

  /// Success colors from Figma
  static const Color success = Color(0xFF00BF8E);
  /// Success color light from Figma
  static const Color successLight = Color(0xFF59CAAD);
  /// Success color dark from Figma
  static const Color successDark = Color(0xFF007658);
  /// Success color with 10% opacity color from Figma
  static final Color successLowOpacity = success.withOpacity(0.1);

  /// Error color from Figma
  static const Color error = Color(0xFFCC2937);
  /// Error light color from Figma
  static const Color errorLight = Color(0xFFF75A68);
  /// Error dark color from Figma
  static const Color errorDark = Color(0xFF2D090C);
  /// Error color with 10% opacity color from Figma
  static final Color errorLowOpacity = error.withOpacity(0.1);

  /// Warning color from Figma
  static const Color warning = Color(0xFFC0812B);
  /// Warning light color from Figma
  static const Color warningLight = Color(0xFFC0812B);
  /// Warning dark color from Figma
  static const Color warningDark = Color(0xFFC0812B);
  /// Warning with 10% opacity color from Figma
  static final Color warningLowOpacity = warning.withOpacity(0.1);

  static const Color grey100 = Color(0xFFE1E1E6);
  static const Color grey200 = Color(0xFFC4C4CC);
  static const Color grey300 = Color(0xFF8D8D99);
  static const Color grey400 = Color(0xFF7C7C8A);
  static const Color grey500 = Color(0xFF505059);
  static const Color grey600 = Color(0xFF323238);
  static const Color grey700 = Color(0xFF29292E);
  static const Color grey800 = Color(0xFF202024);
  static const Color grey900 = Color(0xFF121214);

  static const Color dark100 = Color(0xFF121222);
  static const Color dark50 = Color(0xFF202030);

  static const Color backgroundLight = Colors.white;
  static const Color backgroundDark = dark100;

  static const Color disable = Color(0xFF8D9298);
  static const Color blueGrey = Color(0xFF111D3B);
  static const Color textFieldLight = Color(0xFFF2F2F4);
  static const Color textFieldDark = Color(0xFF202030);
  static const Color separatorLight = Color(0xFFF0F1F5);
}
