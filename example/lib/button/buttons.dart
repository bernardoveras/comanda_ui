import 'package:example/button/comanda_button.dart';
import 'package:example/shared/component_card.dart';
import 'package:example/shared/component_header.dart';
import 'package:flutter/material.dart';

import '../shared/component_scaffold.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  Widget _buildFilledButtons(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        runSpacing: 20,
        alignment: WrapAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton(
              'Primary',
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton.icon(
              'Primary',
              icon: Icons.done,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton('Primary'),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton.icon('Primary', icon: Icons.done),
          ),
        ],
      ),
    );
  }

  Widget _buildOutlinedButtons(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        runSpacing: 20,
        alignment: WrapAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton(
              'Outlined',
              onPressed: () {},
              outlined: true,
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton.icon(
              'Outlined',
              icon: Icons.done,
              onPressed: () {},
              outlined: true,
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton(
              'Outlined',
              outlined: true,
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton.icon(
              'Outlined',
              icon: Icons.done,
              outlined: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextButtons(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        runSpacing: 20,
        alignment: WrapAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton.text(
              'Text',
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton.text(
              'Text',
              icon: Icons.done,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton.text('Text'),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width / 2) - 48) - 10,
            child: ComandaButton.text('Text', icon: Icons.done),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ComponentScaffold(
      'Button',
      children: <Widget>[
        const ComponentHeader(title: 'Normal'),
        ComponentCard(child: _buildFilledButtons(context)),
        const ComponentHeader(title: 'Outlined'),
        ComponentCard(child: _buildOutlinedButtons(context)),
        const ComponentHeader(title: 'Text'),
        ComponentCard(child: _buildTextButtons(context)),
      ],
    );
  }
}
