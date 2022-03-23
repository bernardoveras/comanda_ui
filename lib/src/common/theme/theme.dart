import 'weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class ComandaBetTheme {
  const ComandaBetTheme._();

  // static const String fontFamily = 'Baloo';
  static final ThemeData dark = _base.copyWith(
    brightness: Brightness.dark,
    colorScheme: _base.colorScheme.copyWith(background: ComandaBetColors.backgroundDark),
    backgroundColor: ComandaBetColors.backgroundDark,
    scaffoldBackgroundColor: ComandaBetColors.backgroundDark,
  );

  static final ThemeData light = _base;

  static final ThemeData _base = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    textTheme: GoogleFonts.baloo2TextTheme(),
    primaryColor: ComandaBetColors.primary,
    backgroundColor: ComandaBetColors.backgroundLight,
    scaffoldBackgroundColor: ComandaBetColors.backgroundLight,
    dividerColor: ComandaBetColors.separatorLight,
    colorScheme: ColorScheme.fromSeed(
      primary: ComandaBetColors.primary,
      seedColor: ComandaBetColors.primary,
      secondary: ComandaBetColors.secondary,
      brightness: Brightness.light,
      background: ComandaBetColors.backgroundLight,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 2,
      color: ComandaBetColors.separatorLight,
    ),
    cardTheme: const CardTheme(
      elevation: 3,
      shadowColor: Colors.black45,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: ComandaBetColors.primary,
      iconTheme: IconThemeData(),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ComandaBetColors.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
        textStyle: MaterialStateProperty.all(GoogleFonts.baloo2(fontWeight: Weight.semiBold)),
      ),
    ),
  );
}
