import 'package:comanda_ui/comanda_ui.dart';
import 'package:flutter/material.dart';

import '../shared/component_scaffold.dart';

class TextFields extends StatelessWidget {
  TextFields({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ComponentScaffold(
      'Text Field',
      children: [
        Form(
          key: _formKey,
          child: ComandaTextField(
            hintText: 'E-mail',
            labelText: 'E-mail',
            suffixIcon: Icons.keyboard_arrow_down_rounded,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Informe um e-mail';
              return null;
            },
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ComandaButton(
            'Validate',
            onPressed: () {
              var isValid = _formKey.currentState!.validate();
              if (isValid) print('form_validated');
            },
          ),
        ),
      ],
    );
  }
}
