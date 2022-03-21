
import 'package:comanda_ui/shared/weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComandaSnackBar extends StatelessWidget {
  final String? title;
  final String message;
  final Widget? suffixIcon;
  final bool showCloseButton;

  const ComandaSnackBar({
    Key? key,
    this.title,
    required this.message,
    this.suffixIcon,
    this.showCloseButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...{
                Text(
                  title!,
                  style: GoogleFonts.baloo2(
                    fontWeight: Weight.semiBold,
                    fontSize: 18,
                  ),
                ),
              },
              Text(
                message,
                maxLines: null,
                style: GoogleFonts.baloo2(
                  fontWeight: Weight.regular,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        if (suffixIcon != null) ...{
          suffixIcon!,
        } else if (showCloseButton) ...{
          SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        },
      ],
    );
  }
}
