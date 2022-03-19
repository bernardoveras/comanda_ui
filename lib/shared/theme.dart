import 'package:comanda_ui/shared/weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class CBTheme {
  const CBTheme._();

  // static const String fontFamily = 'Baloo';
  static final ThemeData dark = _base.copyWith(
    brightness: Brightness.dark,
    colorScheme: _base.colorScheme.copyWith(background: ComandaBetColors.backgroundDark),
    backgroundColor: ComandaBetColors.backgroundDark,
    scaffoldBackgroundColor: ComandaBetColors.backgroundDark,
  );

  static final ThemeData light = _base;

  static final ThemeData _base = ThemeData(
    useMaterial3: true,
    dividerTheme: const DividerThemeData(
      thickness: 2,
      color: ComandaBetColors.separatorLight,
    ),
    primaryColor: ComandaBetColors.primary,
    colorScheme: ColorScheme.fromSeed(
      primary: ComandaBetColors.primary,
      seedColor: ComandaBetColors.primary,
      secondary: ComandaBetColors.secondary,
      brightness: Brightness.light,
      background: ComandaBetColors.backgroundLight,
    ),
    backgroundColor: ComandaBetColors.backgroundLight,
    scaffoldBackgroundColor: ComandaBetColors.backgroundLight,
    disabledColor: ComandaBetColors.disable,
    dividerColor: ComandaBetColors.separatorLight,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ComandaBetColors.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
        textStyle: MaterialStateProperty.all(GoogleFonts.baloo2(
          fontWeight: Weight.semiBold(),
        )),
      ),
    ),
  );
}
