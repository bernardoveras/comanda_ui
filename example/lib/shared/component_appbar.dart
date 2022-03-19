import 'package:comanda_ui/shared/colors.dart';
import 'package:comanda_ui/shared/weight.dart';
import 'package:flutter/material.dart';

class ComponentAppBar extends StatelessWidget {
  const ComponentAppBar({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120.0,
      pinned: true,
      floating: false,
      snap: false,
      toolbarHeight: 80,
      titleSpacing: 80,
      backgroundColor: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.primary : ComandaBetColors.dark50,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(24),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: Weight.bold(),
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
