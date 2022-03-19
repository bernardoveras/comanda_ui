import 'package:flutter/cupertino.dart';

class ThemePreference {
  static ValueNotifier<Brightness> theme = ValueNotifier(Brightness.light);

  static findTheme() {
    theme.value = WidgetsBinding.instance!.platformDispatcher.platformBrightness;
  }

  static changeTheme([Brightness? value]) => theme.value = value ?? (theme.value == Brightness.light ? Brightness.dark : Brightness.light);
  static setLightTheme() => changeTheme(Brightness.light);
  static setDarkTheme() => changeTheme(Brightness.dark);
}
