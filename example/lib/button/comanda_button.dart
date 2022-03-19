import 'dart:ui';
import 'dart:math' as math;

import 'package:comanda_ui/shared/colors.dart';
import 'package:flutter/material.dart';

enum Position { left, right }

// ignore: must_be_immutable
class ComandaButton extends StatelessWidget {
  ComandaButton(
    String text, {
    Key? key,
    IconData? icon,
    VoidCallback? onPressed,
    Color? color,
    double? radius,
    double? width,
    double height = 50,
    TextStyle? textStyle,
    Color? foregroundColor,
    bool outlined = false,
    Position iconPosition = Position.right,
  }) : super(key: key) {
    assert(text.isNotEmpty, 'A propriedade "text" não pode ser vazia.');

    _text = text;
    _icon = icon;
    _onPressed = onPressed;
    _color = color;
    _radius = radius;
    _width = width;
    _height = height;
    _textStyle = textStyle;
    _foregroundColor = foregroundColor;
    _outlined = outlined;
    _iconPosition = iconPosition;
    _isText = false;
  }

  late final String _text;
  late final IconData? _icon;

  late final VoidCallback? _onPressed;

  /// Primary color from Theme by default
  late final Color? _color;

  ///  8 by default
  late final double? _radius;

  ///  50 by default
  late final double _height;
  late final double? _width;

  late final TextStyle? _textStyle;

  /// Colors.white by default
  late final Color? _foregroundColor;

  late final bool _outlined;

  /// Position.right by default
  late final Position _iconPosition;

  late bool _isText;

  ComandaButton.secondary(
    String text, {
    Key? key,
    IconData? icon,
    VoidCallback? onPressed,
    double? radius,
    double? width,
    double height = 50,
    TextStyle? textStyle,
    Color? foregroundColor,
    bool outlined = false,
    Position iconPosition = Position.right,
  }) : super(key: key) {
    assert(text.isNotEmpty, 'A propriedade "text" não pode ser vazia.');

    _text = text;
    _icon = icon;
    _onPressed = onPressed;
    _color = ComandaBetColors.secondary;
    _radius = radius;
    _width = width;
    _height = height;
    _textStyle = textStyle;
    _foregroundColor = foregroundColor;
    _outlined = outlined;
    _iconPosition = iconPosition;
    _isText = false;
  }

  ComandaButton.icon(
    String text, {
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    Color? color,
    double? radius,
    double? width,
    double height = 50,
    TextStyle? textStyle,
    Color? foregroundColor,
    bool outlined = false,
    Position iconPosition = Position.right,
  }) : super(key: key) {
    assert(text.isNotEmpty, 'A propriedade "text" não pode ser vazia.');

    _text = text;
    _icon = icon;
    _onPressed = onPressed;
    _color = color;
    _width = width;
    _height = height;
    _radius = radius;
    _textStyle = textStyle;
    _foregroundColor = foregroundColor;
    _outlined = outlined;
    _iconPosition = iconPosition;
    _isText = false;
  }

  ComandaButton.text(
    String text, {
    Key? key,
    IconData? icon,
    VoidCallback? onPressed,
    double? radius,
    double? width,
    double height = 50,
    TextStyle? textStyle,
    Color? foregroundColor,
    Position iconPosition = Position.right,
  }) : super(key: key) {
    assert(text.isNotEmpty, 'A propriedade "text" não pode ser vazia.');

    _text = text;
    _foregroundColor = null;
    _isText = true;
    _icon = icon;
    _onPressed = onPressed;
    _color = null;
    _width = width;
    _height = height;
    _radius = radius;
    _textStyle = textStyle;
    _outlined = false;
    _iconPosition = iconPosition;
  }

  double _calculateGap(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap = scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;

    return gap;
  }

  Widget _buildChild(BuildContext context) => _icon == null ? _buildText() : _buildChildWithIcon(context);

  Widget _buildText() => FittedBox(child: Text(_text));

  Widget _buildChildWithIcon(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (_iconPosition == Position.left) ...{
          Icon(_icon),
          SizedBox(width: _calculateGap(context)),
        },
        Flexible(child: _buildText()),
        if (_iconPosition == Position.right) ...{
          SizedBox(width: _calculateGap(context)),
          Icon(_icon),
        },
      ],
    );
  }

  Color _backgroundColor(BuildContext context) => _color ?? ComandaBetColors.primary;

  MaterialStateProperty<Color?>? _backgroundPropertyColor(BuildContext context) {
    if (_outlined) return MaterialStateProperty.all(Colors.transparent);
    if (_isText) return MaterialStateProperty.all(Colors.transparent);

    if (_color != null) {
      return MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return _backgroundColor(context);
          }
          return null;
        },
      );
    }

    return null;
  }

  MaterialStateProperty<Color?>? _foregroundPropertyColor(BuildContext context) {
    return MaterialStateProperty.resolveWith<Color?>(
      (states) {
        bool disabled = states.contains(MaterialState.disabled);
        if (disabled == false) {
          if (_isText) return _foregroundColor ?? ComandaBetColors.primary;
          if (_outlined) return _backgroundColor(context);

          return _foregroundColor;
        }
        return null;
      },
    );
  }

  MaterialStateProperty<RoundedRectangleBorder?>? _shapeProperty(BuildContext context) {
    return MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
      (states) {
        if (_outlined == false) return null;

        bool disabled = states.contains(MaterialState.disabled);

        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: disabled ? Theme.of(context).disabledColor : _backgroundColor(context),
            width: 2,
          ),
        );
      },
    );
  }

  MaterialStateProperty<Color?>? _overlayPropertyColor(BuildContext context) {
    return MaterialStateProperty.resolveWith<Color?>(
      (states) {
        bool disabled = states.contains(MaterialState.disabled);
        if (disabled == false) {
          if (_outlined) {
            return _color?.withOpacity(0.10) ?? ComandaBetColors.primary.withOpacity(0.10);
          }

          if (_isText) {
            return _color?.withOpacity(0.10) ?? ComandaBetColors.primary.withOpacity(0.10);
          }
        }
        return null;
      },
    );
  }

  ButtonStyle? _baseButtonStyle(BuildContext context) {
    return Theme.of(context).elevatedButtonTheme.style?.copyWith(
          backgroundColor: _backgroundPropertyColor(context),
          shape: _radius != null ? MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius!))) : null,
          textStyle: MaterialStateProperty.all(_textStyle),
          foregroundColor: MaterialStateProperty.all(_foregroundColor),
        );
  }

  ButtonStyle? _buttonStyle(BuildContext context) {
    return _baseButtonStyle(context)?.copyWith(
      foregroundColor: _foregroundPropertyColor(context),
      backgroundColor: _backgroundPropertyColor(context),
      shape: _shapeProperty(context),
      overlayColor: _overlayPropertyColor(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: ElevatedButton(
        child: _buildChild(context),
        onPressed: _onPressed,
        style: _buttonStyle(context),
      ),
    );
  }
}
