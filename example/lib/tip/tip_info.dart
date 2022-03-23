import 'package:comanda_ui/comanda_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipInfo extends StatelessWidget {
  TipInfo({
    Key? key,
    required this.title,
    this.value,
    this.child,
    this.valueMaxLines = 3,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    this.valueMaxWidth,
  }) : super(key: key) {
    _crossAxisAlignment = crossAxisAlignment;
  }

  final String title;
  final String? value;
  final Widget? child;
  final int? valueMaxLines;
  final double? valueMaxWidth;
  late final CrossAxisAlignment _crossAxisAlignment;

  TipInfo.right({
    Key? key,
    required this.title,
    this.value,
    this.child,
    this.valueMaxLines = 3,
    this.valueMaxWidth,
    CrossAxisAlignment? crossAxisAlignment,
  }) : super(key: key) {
    _crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.end;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: _crossAxisAlignment,
      children: [
        Text(
          title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.baloo2(
            fontWeight: Weight.semiBold,
            fontSize: 14,
            color: ComandaBetColors.grey300,
          ),
        ),
        child ??
            LimitedBox(
              maxWidth: valueMaxWidth ?? MediaQuery.of(context).size.width,
              child: Text(
                value ?? '',
                overflow: valueMaxLines != null ? TextOverflow.ellipsis : null,
                maxLines: valueMaxLines,
                style: GoogleFonts.baloo2(
                  fontWeight: Weight.semiBold,
                  fontSize: 18,
                  color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.grey500 : Colors.white,
                ),
              ),
            ),
      ],
    );
  }
}
