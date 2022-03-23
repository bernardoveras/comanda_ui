import 'package:flutter/material.dart';

class ComandaBet {
  ComandaBet._();

  ///Caso for usar com o GetX:
  ///
  ///No MaterialApp, deve alterar:
  ///2.0: navigatorKey: Get.addKey(Modular.navigatorKey),
  ///3.0: Trocar o MaterialApp por GetMaterialApp
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
