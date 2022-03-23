import 'package:comanda_ui/comanda_ui.dart';
import 'package:flutter/material.dart';

import '../shared/component_card.dart';
import '../shared/component_header.dart';
import '../shared/component_scaffold.dart';

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
            spacing: 20,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ComponentHeader(title: leftCheckbox ? 'Ativo' : 'Inativo'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width <= 405 ? double.infinity : null,
                    child: ComponentCard(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
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
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: MediaQuery.of(context).size.width <= 405 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  ComponentHeader(title: rightCheckbox ? 'Ativo' : 'Inativo'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width <= 405 ? double.infinity : null,
                    child: ComponentCard(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
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
