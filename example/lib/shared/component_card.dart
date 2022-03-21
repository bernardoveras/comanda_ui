import 'package:comanda_ui/shared/colors.dart';
import 'package:flutter/material.dart';

class ComponentCard extends StatelessWidget {
  const ComponentCard({
    Key? key,
    this.child,
    this.color,
    this.borderColor,
    this.height,
    this.width,
    this.margin = const EdgeInsets.symmetric(vertical: 14),
    this.padding = const EdgeInsets.all(24),
    this.radius = 8,
    this.border,
  }) : super(key: key);

  final Widget? child;
  final Color? color;
  final Color? borderColor;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? (Theme.of(context).brightness == Brightness.light ? ComandaBetColors.textFieldLight : ComandaBetColors.dark50),
        borderRadius: BorderRadius.circular(radius),
        border: border ?? (borderColor != null ? Border.all(color: borderColor!, width: 1.5) : null),
      ),
      child: child,
    );
  }
}
