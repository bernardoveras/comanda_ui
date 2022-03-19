import 'package:flutter/material.dart';

import 'colors.dart';

class CBTheme {
  const CBTheme._();

  static final ThemeData base = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ComandaBetColors.primary,
      secondary: ComandaBetColors.secondary,
      brightness: Brightness.light,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ComandaBetColors.primary,
    ),
    disabledColor: ComandaBetColors.disable,
    dividerColor: ComandaBetColors.separatorLight,
  );
}
