import 'package:comanda_ui/shared/colors.dart';
import 'package:example/shared/component_appbar.dart';
import 'package:flutter/material.dart';

import '../shared/component_header.dart';
import 'comanda_checkbox.dart';

class CheckBoxes extends StatefulWidget {
  CheckBoxes({Key? key}) : super(key: key);

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
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [const ComponentAppBar(title: 'Checkbox')],
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          Container(
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.textFieldLight : ComandaBetColors.dark100,
                              borderRadius: BorderRadius.circular(8),
                              border: Theme.of(context).brightness == Brightness.dark
                                  ? Border.all(
                                      color: ComandaBetColors.primary,
                                      width: 1.5,
                                    )
                                  : null,
                            ),
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
                          Container(
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.textFieldLight : ComandaBetColors.dark100,
                              borderRadius: BorderRadius.circular(8),
                              border: Theme.of(context).brightness == Brightness.dark
                                  ? Border.all(
                                      color: ComandaBetColors.primary,
                                      width: 1.5,
                                    )
                                  : null,
                            ),
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
            ),
          ),
        ),
      ),
    );
  }
}
