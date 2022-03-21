import 'package:flutter/material.dart';

import '../shared/component_card.dart';
import '../shared/component_header.dart';
import '../shared/component_scaffold.dart';
import 'comanda_checkbox.dart';

class CheckBoxes extends StatefulWidget {
  const CheckBoxes({Key? key}) : super(key: key);

  @override
  State<CheckBoxes> createState() => _CheckBoxesState();
}

class _CheckBoxesState extends State<CheckBoxes> {
  bool leftCheckbox = true;
  bool rightCheckbox = false;

  void changeLeftActive(bool value) => setState(() => leftCheckbox = value);
  void changeRightActive(bool value) => setState(() => rightCheckbox = value);

  @override
  Widget build(BuildContext context) {
    return ComponentScaffold(
      'Checkbox',
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ComponentHeader(title: leftCheckbox ? 'Ativo' : 'Inativo'),
                  ComponentCard(
                    child: Wrap(
                      spacing: 20,
                      children: [
                        ComandaCheckBox(
                          value: leftCheckbox,
                          onChanged: (v) => changeLeftActive(v),
                        ),
                        ComandaCheckBox(
                          text: 'Title',
                          value: leftCheckbox,
                          onChanged: (v) => changeLeftActive(v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ComponentHeader(title: rightCheckbox ? 'Ativo' : 'Inativo'),
                  ComponentCard(
                    child: Wrap(
                      spacing: 20,
                      children: [
                        ComandaCheckBox(
                          value: rightCheckbox,
                          onChanged: (v) => changeRightActive(v),
                        ),
                        ComandaCheckBox(
                          text: 'Title',
                          value: rightCheckbox,
                          onChanged: (v) => changeRightActive(v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
