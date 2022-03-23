import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/theme/colors.dart';
import '../common/theme/weight.dart';

class ComandaCheckBox extends StatelessWidget {
  ComandaCheckBox({
    Key? key,
    required bool value,
    ValueChanged<bool>? onChanged,
    String? text,
    Color? foregroundColor,
  }) : super(key: key) {
    _value = value;
    _onChanged = onChanged;
    _text = text;
  }

  late final bool _value;
  late final String? _text;
  late final ValueChanged<bool>? _onChanged;

  Color _borderColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      if (_value == true) return ComandaBetColors.primary;
      return ComandaBetColors.grey100;
    }

    if (_value == true) return ComandaBetColors.primary;
    return const Color(0xFF2D2D44);
  }

  Color _backgroundColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      if (_value == true) return ComandaBetColors.primaryLowOpacity;
      return ComandaBetColors.grey100;
    }

    if (_value == true) return ComandaBetColors.primaryLowOpacity;
    return const Color(0xFF242435);
  }

  Color _iconColor(BuildContext context) {
    if (_value == true) {
      if (Theme.of(context).brightness == Brightness.light) {
        return ComandaBetColors.primary;
      }

      return Colors.white;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: _onChanged != null ? SystemMouseCursors.click :SystemMouseCursors.noDrop,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onChanged?.call(!_value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              height: 30,
              width: 30,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linearToEaseOut,
              decoration: BoxDecoration(
                color: _backgroundColor(context),
                border: Border.all(
                  color: _borderColor(context),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _value == true
                  ? FittedBox(
                      child: Icon(
                        Icons.check_rounded,
                        color: _iconColor(context),
                      ),
                    )
                  : null,
            ),
            if (_text != null) ...{
              const SizedBox(width: 10),
              FittedBox(
                child: Text(
                  _text!,
                  style: GoogleFonts.baloo2(
                    color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.grey600 : Colors.white,
                    fontSize: 16,
                    fontWeight: Weight.regular,
                  ),
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
