import 'package:comanda_ui/shared/theme.dart';
import 'package:example/checkbox/checkboxes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comanda Design System',
      debugShowCheckedModeBanner: false,
      darkTheme: CBTheme.dark,
      theme: CBTheme.light,
      // themeMode: ThemeMode.dark,
      home: CheckBoxes(),
    );
  }
}
