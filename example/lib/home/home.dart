import 'package:example/button/buttons.dart';
import 'package:example/button/comanda_button.dart';
import 'package:example/checkbox/checkboxes.dart';
import 'package:example/shared/component_appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [const ComponentAppBar(title: 'Componentes')],
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              spacing: 20,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}