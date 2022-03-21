import 'package:comanda_ui/shared/colors.dart';
import 'package:comanda_ui/shared/weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/component_scaffold.dart';

class TextFields extends StatelessWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentScaffold(
      'Text Field',
      children: [
        ComandaTextField(
          hintText: 'E-mail',
          labelText: 'E-mail',
          suffixIcon: Icons.keyboard_arrow_down_rounded,
        ),
      ],
    );
  }
}

class ComandaTextField extends StatelessWidget {
  ComandaTextField({
    Key? key,
    String? labelText,
    TextStyle? labelStyle,
    String? hintText,
    TextStyle? hintStyle,
    Widget? suffix,
    IconData? suffixIcon,
    Color? suffixIconColor,
    Widget? prefix,
    IconData? prefixIcon,
    Color? prefixIconColor,
  }) : super(key: key) {
    _labelText = labelText;
    _labelStyle = labelStyle;

    _hintText = hintText;
    _hintStyle = hintStyle;

    _suffix = suffix;
    _suffixIcon = suffixIcon;
    _suffixIconColor = suffixIconColor;

    _prefix = prefix;
    _prefixIcon = prefixIcon;
    _prefixIconColor = prefixIconColor;
  }

  late final String? _labelText;
  late final TextStyle? _labelStyle;

  late final String? _hintText;
  late final TextStyle? _hintStyle;

  late final Widget? _suffix;
  late final IconData? _suffixIcon;
  late final Color? _suffixIconColor;

  late final Widget? _prefix;
  late final IconData? _prefixIcon;
  late final Color? _prefixIconColor;

  Widget? _buildPrefix(BuildContext context) {
    if (_prefix != null) return _prefix;

    if (_prefixIcon == null) return null;

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 14.0, end: 5),
      child: Icon(
        _prefixIcon,
        size: 20,
        color: _prefixIconColor ?? (Theme.of(context).brightness == Brightness.light ? ComandaBetColors.grey300 : ComandaBetColors.grey200),
      ),
    );
  }

  Widget? _buildSuffix(BuildContext context) {
    if (_suffix != null) return _prefix;

    if (_suffixIcon == null) return null;

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14.0),
      child: Icon(
        _suffixIcon,
        size: 20,
        color: _suffixIconColor ?? (Theme.of(context).brightness == Brightness.light ? ComandaBetColors.grey300 : ComandaBetColors.grey200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_labelText != null) ...{
          Text(
            _labelText!,
            style: GoogleFonts.baloo2(
              fontSize: 18,
              fontWeight: Weight.semiBold,
              color: ComandaBetColors.blueGrey,
            ),
          ),
        },
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.textFieldLight : ComandaBetColors.textFieldDark,
            border: InputBorder.none,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ComandaBetColors.error,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ComandaBetColors.primary,
                width: 1.5,
              ),
            ),
            disabledBorder: InputBorder.none,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ComandaBetColors.error,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(14),
            hintText: _hintText,
            hintStyle: _hintStyle ??
                GoogleFonts.baloo2(
                  fontSize: 14,
                  fontWeight: Weight.regular,
                  color: ComandaBetColors.grey300,
                ),
            prefixIcon: _buildPrefix(context),
            suffixIcon: _buildSuffix(context),
          ),
        ),
      ],
    );
  }
}
