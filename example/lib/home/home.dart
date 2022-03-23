import 'package:comanda_ui/comanda_ui.dart';
import 'package:example/button/buttons.dart';
import 'package:example/checkbox/checkboxes.dart';
import 'package:example/shared/component_appbar.dart';
import 'package:example/snackbar/snackbars.dart';
import 'package:example/textfields/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../tip/tips.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  late PageController pageController;

  Widget buildHomePage(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, _) => [const ComponentAppBar(title: 'ComandaBet')],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              ComandaButton('Botão', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Buttons()),
                );
              }),
              ComandaButton('Checkbox', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckBoxes()),
                );
              }),
              ComandaButton('TextField', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextFields()),
                );
              }),
              ComandaButton('SnackBar', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SnackBars()),
                );
              }),
              ComandaButton('Tip', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tips()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          buildHomePage(context),
          const Buttons(),
          const CheckBoxes(),
          TextFields(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : ComandaBetColors.dark50,
        iconSize: 24,
        selectedIconTheme: const IconThemeData(color: ComandaBetColors.primary),
        onTap: (v) => setState(() {
          currentPage = v;
          pageController.jumpToPage(v);
        }),
        selectedItemColor: ComandaBetColors.primary,
        unselectedItemColor: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.blueGrey : ComandaBetColors.grey300,
        selectedLabelStyle: GoogleFonts.baloo2(
          color: ComandaBetColors.primary,
          fontSize: 12,
          fontWeight: Weight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.baloo2(
          fontSize: 12,
          fontWeight: Weight.medium,
        ),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_button_rounded), label: 'Button'),
          BottomNavigationBarItem(icon: Icon(Icons.radio_button_checked), label: 'Checkbox'),
          BottomNavigationBarItem(icon: Icon(Icons.text_fields_rounded), label: 'TextField'),
        ],
      ),
    );
  }
}
