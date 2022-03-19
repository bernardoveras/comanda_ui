import 'package:comanda_ui/shared/colors.dart';
import 'package:flutter/material.dart';

class ComponentCard extends StatelessWidget {
  const ComponentCard({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
    );
  }
}
