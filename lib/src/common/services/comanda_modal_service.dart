import 'package:comanda_ui/comanda_ui.dart';
import 'package:flutter/material.dart';

abstract class IComandaModalService {}

class ComandaModalService implements IComandaModalService {
  ComandaModalService._();

  static Future<void> show({
    Key? key,
    String? title,
    String? description,
    String? primaryButtonText,
    void Function()? onPrimaryPressed,
    Color? primaryButtonColor,
    Color primaryForegroundColor = Colors.white,
    String? secondaryButtonText,
    void Function()? onSecondaryPressed,
    Axis buttonsDirection = Axis.horizontal,
    Color? secondaryForegroundColor,
    bool closeOnClickButton = true,
  }) {
    return showModalBottomSheet(
      context: ComandaBet.navigatorKey.currentState!.overlay!.context,
      builder: (_) => ComandaModal(
        key: key,
        title: title,
        description: description,
        primaryButtonText: primaryButtonText,
        onPrimaryPressed: onPrimaryPressed,
        secondaryButtonText: secondaryButtonText,
        onSecondaryPressed: onSecondaryPressed,
        primaryButtonColor: primaryButtonColor,
        primaryForegroundColor: primaryForegroundColor,
        buttonsDirection: buttonsDirection,
        secondaryForegroundColor: secondaryForegroundColor,
        closeOnClickButton: closeOnClickButton,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
