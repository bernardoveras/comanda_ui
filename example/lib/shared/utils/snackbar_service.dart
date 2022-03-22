import 'package:comanda_ui/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../comanda.dart';
import '../../snackbar/comanda_snackbar.dart';

abstract class IComandaSnackBarService {}

class ComandaSnackBarService {
  ComandaSnackBarService._();

  static void show(
    String message, {
    String? title,
    bool showSuffixIcon = true,
    Widget? suffix,
    IconData? suffixIcon,
    VoidCallback? onSuffixIconPressed,
  }) {
    ScaffoldMessenger.of(Comanda.navigatorKey.currentState!.overlay!.context).showSnackBar(SnackBar(
      content: ComandaSnackBar(
        title: title,
        message: message,
        showSuffixIcon: showSuffixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        onSuffixIconPressed: onSuffixIconPressed,
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      backgroundColor: ComandaBetColors.primary,
      duration: const Duration(seconds: 5),
    ));
  }
}
