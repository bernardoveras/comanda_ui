import 'package:comanda_ui/shared/colors.dart';
import 'package:comanda_ui/shared/weight.dart';
import 'package:example/button/comanda_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/component_scaffold.dart';

class TextFields extends StatelessWidget {
  TextFields({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ComponentScaffold(
      'Text Field',
      children: [
        Form(
          key: _formKey,
          child: ComandaTextField(
            hintText: 'E-mail',
            labelText: 'E-mail',
            suffixIcon: Icons.keyboard_arrow_down_rounded,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Informe um e-mail';
              return null;
            },
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ComandaButton(
            'Validate',
            onPressed: () {
              var isValid = _formKey.currentState!.validate();
              if (isValid) print('form_validated');
            },
          ),
        ),
      ],
    );
  }
}

class ComandaTextField extends StatefulWidget {
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
    TextEditingController? controller,
    Iterable<String>? autofillHints,
    bool autofocus = false,
    FocusNode? focusNode,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool readOnly = false,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    String? errorText,
    String? helperText,
    TextStyle? helperStyle,
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

    _controller = controller;
    _autofillHints = autofillHints;
    _autofocus = autofocus;
    _focusNode = focusNode;
    _inputFormatters = inputFormatters;
    _keyboardType = keyboardType;
    _obscureText = obscureText;
    _readOnly = readOnly;
    _onChanged = onChanged;
    _validator = validator;
    _textInputAction = textInputAction;

    _errorText = errorText;
    _helperText = helperText;
    _helperStyle = helperStyle;
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

  late final TextEditingController? _controller;
  late final Iterable<String>? _autofillHints;
  late final bool _autofocus;
  late final FocusNode? _focusNode;
  late final List<TextInputFormatter>? _inputFormatters;
  late final TextInputType? _keyboardType;
  late final bool _obscureText;
  late final bool _readOnly;
  late final ValueChanged<String>? _onChanged;
  late final String? Function(String?)? _validator;
  late final TextInputAction? _textInputAction;

  late final String? _errorText;
  late final String? _helperText;
  late final TextStyle? _helperStyle;

  @override
  State<ComandaTextField> createState() => _ComandaTextFieldState();
}

class _ComandaTextFieldState extends State<ComandaTextField> {
  bool _hasError = false;
  void setHasError(bool value) => setState(() => _hasError = value);

  Widget? get _prefix {
    if (widget._prefix != null) return widget._prefix;

    if (widget._prefixIcon == null) return null;

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 14.0, end: 5),
      child: Icon(
        widget._prefixIcon,
        size: 20,
        color: _iconForegroundColor(suffix: false),
      ),
    );
  }

  Widget? get _suffix {
    if (widget._suffix != null) return widget._prefix;

    if (widget._suffixIcon == null) return null;

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14.0),
      child: Icon(widget._suffixIcon, size: 20, color: _iconForegroundColor()),
    );
  }

  Color get _fillColor {
    if (_hasError) return ComandaBetColors.errorLowOpacity;

    if (Theme.of(context).brightness == Brightness.light) return ComandaBetColors.textFieldLight;

    return ComandaBetColors.textFieldDark;
  }

  Color get _hintForegroundColor {
    if (_hasError) return ComandaBetColors.error;

    if (Theme.of(context).brightness == Brightness.light) return ComandaBetColors.grey300;

    return ComandaBetColors.grey200;
  }

  Color _iconForegroundColor({bool suffix = true}) {
    if (_hasError) return ComandaBetColors.error;
    if (suffix == true && widget._suffixIconColor != null) return widget._suffixIconColor!;
    if (suffix == false && widget._prefixIconColor != null) return widget._prefixIconColor!;

    if (Theme.of(context).brightness == Brightness.light) return ComandaBetColors.grey300;

    return ComandaBetColors.grey200;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget._labelText != null) ...{
          Text(
            widget._labelText!,
            style: widget._labelStyle ??
                GoogleFonts.baloo2(
                  fontSize: 18,
                  fontWeight: Weight.semiBold,
                  color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.blueGrey : Colors.white,
                ),
          ),
        },
        TextFormField(
          controller: widget._controller,
          autofillHints: widget._autofillHints,
          autofocus: widget._autofocus,
          focusNode: widget._focusNode,
          inputFormatters: widget._inputFormatters,
          keyboardType: widget._keyboardType,
          obscureText: widget._obscureText,
          readOnly: widget._readOnly,
          onChanged: widget._onChanged,
          validator: (value) {
            final String? validator = widget._validator?.call(value);

            if (validator?.isNotEmpty == true) {
              setHasError(true);
            } else if (_hasError != false) {
              setHasError(false);
            }

            return validator;
          },
          textInputAction: widget._textInputAction,
          style: GoogleFonts.baloo2(
            fontSize: 16,
            fontWeight: Weight.semiBold,
            color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: _fillColor,
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
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ComandaBetColors.error,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.all(14),
            hintText: widget._hintText,
            hintStyle: widget._hintStyle ??
                GoogleFonts.baloo2(
                  fontSize: 14,
                  fontWeight: Weight.regular,
                  color: _hintForegroundColor,
                ),
            helperText: widget._helperText,
            helperStyle: widget._helperStyle ??
                GoogleFonts.baloo2(
                  fontSize: 14,
                  fontWeight: Weight.regular,
                  color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.grey300 : ComandaBetColors.grey200,
                ),
            errorText: widget._errorText,
            errorStyle: GoogleFonts.baloo2(
              fontSize: 14,
              fontWeight: Weight.regular,
              color: ComandaBetColors.error,
            ),
            prefixIcon: _prefix,
            suffixIcon: _suffix,
          ),
        ),
      ],
    );
  }
}
