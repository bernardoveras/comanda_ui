import 'package:comanda_ui/shared/colors.dart';
import 'package:comanda_ui/shared/weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComponentHeader extends StatelessWidget {
  const ComponentHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.baloo2(
        fontSize: 18,
        fontWeight: Weight.semiBold(),
        color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.blueGrey : Colors.white,
      ),
    );
  }
}
