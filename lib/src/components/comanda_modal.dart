import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/theme/colors.dart';
import '../common/theme/weight.dart';
import 'comanda_button.dart';

class ComandaModal extends StatelessWidget {
  const ComandaModal({
    Key? key,
    this.title,
    this.description,
    this.primaryButtonText,
    this.onPrimaryPressed,
    this.primaryButtonColor,
    this.primaryForegroundColor = Colors.white,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.buttonsDirection = Axis.horizontal,
    this.secondaryForegroundColor,
    this.closeOnClickButton = true,
  }) : super(key: key);

  final String? title;
  final String? description;

  final String? primaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final Color? primaryButtonColor;
  final Color primaryForegroundColor;

  final String? secondaryButtonText;
  final Color? secondaryForegroundColor;
  final VoidCallback? onSecondaryPressed;

  final Axis buttonsDirection;

  final bool closeOnClickButton;

  bool get hasTitle => title?.isNotEmpty == true;
  bool get hasDescription => description?.isNotEmpty == true;

  bool get hasButton => hasOneButton || hasTwoButtons;
  bool get hasOneButton => primaryButtonText?.isNotEmpty == true && secondaryButtonText == null;
  bool get hasTwoButtons => primaryButtonText?.isNotEmpty == true && secondaryButtonText?.isNotEmpty == true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(32),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasTitle) ...{
                Text(
                  title!,
                  style: GoogleFonts.baloo2(
                    fontSize: 18,
                    fontWeight: Weight.semiBold,
                    color: ComandaBetColors.grey600,
                  ),
                  textAlign: TextAlign.center,
                ),
              },
              if (hasDescription) ...{
                Text(
                  description!,
                  style: GoogleFonts.baloo2(
                    fontSize: 16,
                    fontWeight: Weight.regular,
                    color: ComandaBetColors.grey400,
                  ),
                  textAlign: TextAlign.center,
                ),
              },
              if (hasButton) ...{
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  spacing: 10,
                  runSpacing: 10,
                  direction: buttonsDirection,
                  verticalDirection: constraints.maxWidth <= 250 || buttonsDirection == Axis.vertical ? VerticalDirection.up : VerticalDirection.down,
                  children: [
                    if (secondaryButtonText?.isNotEmpty == true) ...{
                      SizedBox(
                        width:
                            constraints.maxWidth <= 250 || buttonsDirection == Axis.vertical ? constraints.maxWidth : (constraints.maxWidth / 2) - 5,
                        child: ComandaButton(
                          secondaryButtonText!,
                          onPressed: () {
                            onSecondaryPressed?.call();
                            if (closeOnClickButton) Navigator.pop(context);
                          },
                          outlined: true,
                          color: secondaryForegroundColor,
                        ),
                      ),
                    },
                    if (primaryButtonText?.isNotEmpty == true) ...{
                      SizedBox(
                        width: hasOneButton
                            ? double.infinity
                            : constraints.maxWidth <= 250 || buttonsDirection == Axis.vertical
                                ? constraints.maxWidth
                                : (constraints.maxWidth / 2) - 5,
                        child: ComandaButton(
                          primaryButtonText!,
                          foregroundColor: primaryForegroundColor,
                          color: primaryButtonColor,
                          onPressed: () {
                            onPrimaryPressed?.call();
                            if (closeOnClickButton) Navigator.pop(context);
                          },
                        ),
                      ),
                    },
                  ],
                ),
              },
            ],
          );
        },
      ),
    );
  }
}
