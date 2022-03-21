import 'package:comanda_ui/shared/weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComandaSnackBar extends StatelessWidget {
  final String? title;
  final String message;
  final IconData? suffixIcon;
  final Widget? suffix;
  final bool showSuffixIcon;
  final VoidCallback? onSuffixIconPressed;

  const ComandaSnackBar({
    Key? key,
    this.title,
    required this.message,
    this.suffixIcon,
    this.suffix,
    this.showSuffixIcon = true,
    this.onSuffixIconPressed,
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
                    color: Colors.white,
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
        if (suffix != null) ...{
          suffix!,
        } else if (showSuffixIcon) ...{
          SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              icon: Icon(
                suffixIcon ?? Icons.close_rounded,
                color: Colors.white,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                if (onSuffixIconPressed != null) {
                  onSuffixIconPressed?.call();
                } else {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                }
              },
            ),
          ),
        },
      ],
    );
  }
}
