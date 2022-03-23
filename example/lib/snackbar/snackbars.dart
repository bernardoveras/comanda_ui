import 'package:comanda_ui/comanda_ui.dart';
import 'package:example/shared/component_card.dart';
import 'package:flutter/material.dart';

import '../shared/component_scaffold.dart';

class SnackBars extends StatelessWidget {
  const SnackBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentScaffold(
      'SnackBar',
      children: [
        ComponentCard(
          color: ComandaBetColors.primary,
          child: ComandaSnackBar(message: 'Arquivo marcado como favorito.', onSuffixIconPressed: () {}),
        ),
        ComponentCard(
          color: ComandaBetColors.primary,
          child: ComandaSnackBar(
            message: 'Arquivo marcado como favorito.',
            onSuffixIconPressed: () {},
            showSuffixIcon: false,
          ),
        ),
        ComponentCard(
          color: ComandaBetColors.primary,
          child: ComandaSnackBar(
            message: 'Arquivo marcado como favorito.',
            onSuffixIconPressed: () {},
            suffixIcon: Icons.rocket_launch_rounded,
          ),
        ),
        ComponentCard(
          color: ComandaBetColors.primary,
          child: ComandaSnackBar(
            title: 'Sucesso!',
            message: 'Arquivo marcado como favorito.',
            onSuffixIconPressed: () {},
          ),
        ),
      ],
    );
  }
}
