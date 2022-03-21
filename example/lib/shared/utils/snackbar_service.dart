import 'package:comanda_ui/shared/colors.dart';
import 'package:flutter/material.dart';

import '../../snackbar/comanda_snackbar.dart';

abstract class IComandaSnackBarService {}

class ComandaSnackBarService {
  ComandaSnackBarService._();

  ///Caso for usar com o GetX:
  ///
  ///No MaterialApp, deve alterar:
  ///2.0: navigatorKey: Get.addKey(Modular.navigatorKey),
  ///3.0: Trocar o MaterialApp por GetMaterialApp
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void show(
    String message, {
    String? title,
    bool showCloseButton = true,
    Widget? suffixIcon,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentState!.overlay!.context).showSnackBar(SnackBar(
      content: ComandaSnackBar(
        title: title,
        message: message,
        showCloseButton: showCloseButton,
        suffixIcon: suffixIcon,
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      backgroundColor: ComandaBetColors.primary,
      duration: const Duration(seconds: 5),
    ));
  }
}
