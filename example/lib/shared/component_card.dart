import 'package:comanda_ui/shared/colors.dart';
import 'package:flutter/material.dart';

class ComponentCard extends StatelessWidget {
  const ComponentCard({Key? key, this.child, this.backgroundColor, this.borderColor}) : super(key: key);

  final Widget? child;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: backgroundColor ?? (Theme.of(context).brightness == Brightness.light ? ComandaBetColors.textFieldLight : ComandaBetColors.dark50),
        borderRadius: BorderRadius.circular(8),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: 1.5,
              )
            : null,
      ),
      child: child,
    );
  }
}
