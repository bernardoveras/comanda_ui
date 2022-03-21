import 'package:example/button/buttons.dart';
import 'package:example/button/comanda_button.dart';
import 'package:example/checkbox/checkboxes.dart';
import 'package:example/shared/component_appbar.dart';
import 'package:example/snackbar/snackbars.dart';
import 'package:example/textfields/text_fields.dart';
import 'package:flutter/material.dart';

import '../tip/tips.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
      ),
    );
  }
}
