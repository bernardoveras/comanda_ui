import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../common/theme/colors.dart';

enum Position { left, right }

// ignore: must_be_immutable
class ComandaButton extends StatelessWidget {
  ComandaButton(
    String text, {
    Key? key,
    IconData? icon,
    VoidCallback? onPressed,
    Color? color,
    double radius = 8,
    double? width,
    double? height = 50,
    TextStyle? textStyle,
    Color? foregroundColor,
    bool outlined = false,
    Position iconPosition = Position.right,
    EdgeInsetsGeometry? padding,
  }) : super(key: key) {
    assert(text.isNotEmpty, 'A propriedade "text" não pode ser vazia.');

    _text = text;
    _icon = icon;
    _onPressed = onPressed;
    _color = color;
    _width = width;
    _height = height;
    _textStyle = textStyle;
    _foregroundColor = foregroundColor;
    _outlined = outlined;
    _iconPosition = iconPosition;
    _padding = padding;
    _isText = false;
    _radius = radius;
  }

  late final String _text;
  late final IconData? _icon;

  late final VoidCallback? _onPressed;

  /// Primary color from Theme by default
  late final Color? _color;

  ///  8 by default
  late final double _radius;

  ///  50 by default
  late final double? _height;
  late final double? _width;

  late final TextStyle? _textStyle;

  /// Colors.white by default
  late final Color? _foregroundColor;

  late final bool _outlined;

  /// Position.right by default
  late final Position _iconPosition;

  late final EdgeInsetsGeometry? _padding;

  late bool _isText;

  ComandaButton.secondary(
    String text, {
    Key? key,
    IconData? icon,
    VoidCallback? onPressed,
    double radius = 8,
    double? width,
    double? height = 50,
    TextStyle? textStyle,
    Color? foregroundColor,
    bool outlined = false,
    Position iconPosition = Position.right,
    EdgeInsetsGeometry? padding,
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
    _padding = padding;
  }

  ComandaButton.icon(
    String text, {
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    Color? color,
    double radius = 8,
    double? width,
    double? height = 50,
    TextStyle? textStyle,
    Color? foregroundColor,
    bool outlined = false,
    Position iconPosition = Position.right,
    EdgeInsetsGeometry? padding,
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
    _padding = padding;
  }

  ComandaButton.text(
    String text, {
    Key? key,
    IconData? icon,
    VoidCallback? onPressed,
    double radius = 8,
    double? width,
    double? height = 50,
    TextStyle? textStyle,
    Color? foregroundColor,
    Position iconPosition = Position.right,
    EdgeInsetsGeometry? padding,
  }) : super(key: key) {
    assert(text.isNotEmpty, 'A propriedade "text" não pode ser vazia.');

    _text = text;
    _foregroundColor = foregroundColor;
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
    _padding = padding;
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
          FittedBox(child: Icon(_icon)),
          SizedBox(width: _calculateGap(context)),
        },
        Flexible(child: _buildText()),
        if (_iconPosition == Position.right) ...{
          SizedBox(width: _calculateGap(context)),
          FittedBox(child: Icon(_icon)),
        },
      ],
    );
  }

  Color _backgroundColor(BuildContext context) => _color ?? ComandaBetColors.primary;

  MaterialStateProperty<Color?>? _backgroundPropertyColor(BuildContext context) {
    if (_outlined) return MaterialStateProperty.all(Colors.transparent);
    if (_isText) return MaterialStateProperty.all(Colors.transparent);

    return MaterialStateProperty.resolveWith<Color?>(
      (states) {
        bool disabled = states.contains(MaterialState.disabled);

        if (!disabled) {
          return _backgroundColor(context);
        } else {
          return ComandaBetColors.grey200;
        }
      },
    );
  }

  MaterialStateProperty<Color?>? _foregroundPropertyColor(BuildContext context) {
    return MaterialStateProperty.resolveWith<Color?>(
      (states) {
        bool disabled = states.contains(MaterialState.disabled);
        if (disabled == false) {
          if (_isText) return _foregroundColor ?? ComandaBetColors.primary;
          if (_outlined) return _backgroundColor(context);

          return _foregroundColor;
        } else {
          if (!_isText) return Theme.of(context).brightness == Brightness.light ? ComandaBetColors.grey400 : ComandaBetColors.grey300;

          return ComandaBetColors.grey400;
        }
      },
    );
  }

  MaterialStateProperty<RoundedRectangleBorder?>? _shapeProperty(BuildContext context) {
    return MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
      (states) {
        if (_outlined == false) return null;

        bool disabled = states.contains(MaterialState.disabled);

        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
          side: BorderSide(
            color: disabled
                ? (Theme.of(context).brightness == Brightness.light ? ComandaBetColors.grey400 : ComandaBetColors.grey300)
                :  _backgroundColor(context),
            width: 1.5,
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
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius))),
          textStyle: MaterialStateProperty.all(_textStyle),
          foregroundColor: MaterialStateProperty.all(_foregroundColor),
          padding: MaterialStateProperty.all(_padding),
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
