import 'package:comanda_ui/shared/theme.dart';
import 'package:example/checkbox/checkboxes.dart';
import 'package:example/shared/utils/theme_preference.dart';
import 'package:flutter/material.dart';

import 'button/buttons.dart';
import 'home/home.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    ThemePreference.findTheme();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    ThemePreference.findTheme();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemePreference.theme,
      builder: (context, Brightness theme, _) => MaterialApp(
        title: 'Comanda Design System',
        debugShowCheckedModeBanner: false,
        darkTheme: CBTheme.dark,
        theme: CBTheme.light,
        themeMode: theme == Brightness.light ? ThemeMode.light : ThemeMode.dark,
        home: Home(),
      ),
    );
  }
}
