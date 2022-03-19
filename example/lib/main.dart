import 'package:comanda_ui/shared/colors.dart';
import 'package:comanda_ui/shared/theme.dart';
import 'package:comanda_ui/shared/weight.dart';
import 'package:flutter/material.dart';

import 'buttons/cb_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fontFamily = 'Roboto';
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: ComandaBetColors.primary,
        colorScheme: ColorScheme.fromSeed(
          primary: ComandaBetColors.primary,
          seedColor: ComandaBetColors.primary,
          secondary: ComandaBetColors.secondary,
          brightness: Brightness.light,
        ),
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
            textStyle: MaterialStateProperty.all(TextStyle(
              fontFamily: fontFamily,
              fontWeight: Weight.semiBold(),
              overflow: TextOverflow.ellipsis,
            )),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CBButton(
              'Botão',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            CBButton(
              'Botão',
              icon: Icons.person,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            CBButton(
              'Botão',
              icon: Icons.person,
              onPressed: () {},
              outlined: true,
            ),
            const SizedBox(height: 20),
            CBButton(
              'Botão',
            ),
            const SizedBox(height: 20),
            CBButton(
              'Botão',
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            CBButton(
              'Botão',
              icon: Icons.person,
              // onPressed: () {},
              outlined: true,
            ),
          ],
        ),
      ),
    );
  }
}
