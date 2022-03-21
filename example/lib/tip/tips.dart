import 'package:example/shared/component_scaffold.dart';
import 'package:example/tip/tip_status.dart';
import 'package:example/tip/tip_widget.dart';
import 'package:flutter/material.dart';

class Tips extends StatelessWidget {
  Tips({Key? key}) : super(key: key);

  final GlobalKey jogoAndOddSugeridaKey = GlobalKey();

  double maxWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return const ComponentScaffold(
      'Tip',
      children: [
        TipWidget(
          market: 'Escanteios',
          match: 'Flamengo x Vasco',
          link: 'http://www.bet365.com',
          suggestedOdd: 1.82,
          timeInMinutes: 37,
          details: 'Entrar em canto limite!',
          result: TipStatus.green,
        ),
      ],
    );
  }
}
