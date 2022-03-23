import 'package:comanda_ui/comanda_ui.dart';
import 'package:example/tip/tip_status.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/component_card.dart';

class TipResult extends StatelessWidget {
  const TipResult({Key? key, this.status}) : super(key: key);

  final TipStatus? status;

  Color get _colorFromStatus {
    if (status == TipStatus.green) return ComandaBetColors.success;
    if (status == TipStatus.red) return ComandaBetColors.error;

    return ComandaBetColors.grey100;
  }

  Color get _backgroundColorFromStatus {
    if (status == TipStatus.refund || status == TipStatus.cancelled || status == null) {
      return ComandaBetColors.grey100;
    }

    return _colorFromStatus.withOpacity(0.10);
  }

  Color get _foregroundColorFromStatus {
    if (status == TipStatus.refund || status == TipStatus.cancelled || status == null) {
      return const Color(0xFF7C7C8A);
    }

    return _colorFromStatus;
  }

  String get _textFromStatus {
    if (status == TipStatus.green) return 'Green';
    if (status == TipStatus.red) return 'Red';
    if (status == TipStatus.cancelled) return 'Cancelado';
    if (status == TipStatus.refund) return 'Devolvida';

    return 'Aguardando';
  }

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      radius: 4,
      color: _backgroundColorFromStatus,
      child: Text(
        _textFromStatus,
        style: GoogleFonts.baloo2(
          color: _foregroundColorFromStatus,
          fontWeight: Weight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}