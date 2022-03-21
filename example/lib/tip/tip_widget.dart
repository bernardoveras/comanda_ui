import 'package:comanda_ui/shared/colors.dart';
import 'package:comanda_ui/shared/weight.dart';
import 'package:example/tip/tip_info.dart';
import 'package:example/tip/tip_result.dart';
import 'package:example/tip/tip_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../button/comanda_button.dart';
import '../shared/component_card.dart';
import '../shared/utils/snackbar_service.dart';

class TipWidget extends StatelessWidget {
  const TipWidget({
    Key? key,
    required this.market,
    required this.match,
    this.details,
    required this.timeInMinutes,
    required this.suggestedOdd,
    this.result,
    required this.link,
    this.adminMode = true,
  }) : super(key: key);

  final String market;
  final String match;
  final String? details;
  final int timeInMinutes;
  final double suggestedOdd;
  final TipStatus? result;
  final String link;
  final bool adminMode;

  String get _formattedSuggestedOdd {
    if (suggestedOdd <= 0) return 'undefined';

    String formattedString = suggestedOdd.toString().replaceAll('.', ',');

    if (formattedString.length <= 3) return formattedString + '0';
    if (formattedString.length <= 4) return formattedString;

    return formattedString.substring(0, 4);
  }

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (adminMode) ...{
            SizedBox(
              width: double.infinity,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                verticalDirection: VerticalDirection.up,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Adicionado por: ',
                          style: GoogleFonts.baloo2(
                            fontWeight: Weight.semiBold,
                            fontSize: 18,
                            color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.blueGrey : Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Bernardo Veras',
                              style: GoogleFonts.baloo2(fontWeight: Weight.bold),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'no dia ',
                          style: GoogleFonts.baloo2(
                            fontWeight: Weight.semiBold,
                            fontSize: 18,
                            color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.blueGrey : Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: '18/03',
                              style: GoogleFonts.baloo2(fontWeight: Weight.bold),
                            ),
                            const TextSpan(text: ' às '),
                            TextSpan(
                              text: '18:30',
                              style: GoogleFonts.baloo2(fontWeight: Weight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.primary : Colors.white,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: ComandaBetColors.grey100, height: 1.5, thickness: 1.5),
            ),
          },
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 20,
              children: [
                TipInfo(
                  title: 'Mercado',
                  value: market,
                ),
                TipInfo(
                  title: 'Tempo',
                  value: '$timeInMinutes min',
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 20,
              children: [
                TipInfo(
                  title: 'Jogo',
                  value: match,
                  valueMaxWidth: 150,
                ),
                TipInfo(
                  title: 'Odd sugerida',
                  value: _formattedSuggestedOdd,
                ),
              ],
            ),
          ),
          if (details?.isNotEmpty == true) ...{
            const SizedBox(height: 5),
            TipInfo(
              title: 'Observação',
              value: details,
              valueMaxLines: null,
            ),
          },
          const SizedBox(height: 5),
          TipInfo(
            title: 'Resultado',
            child: TipResult(status: result),
          ),
          if (result != TipStatus.cancelled) ...{
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ComandaButton.icon(
                'Ir para a bet365'.toUpperCase(),
                icon: Icons.link,
                iconPosition: Position.left,
                color: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.primaryLowOpacity : ComandaBetColors.primary,
                foregroundColor: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.primary : Colors.white,
                textStyle: GoogleFonts.baloo2(
                  fontWeight: Weight.semiBold,
                  fontSize: 14,
                ),
                height: 40,
                onPressed: () {
                  ///TODO: Abrir o link do palpite
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ComandaButton.text(
                'Copiar link'.toUpperCase(),
                icon: Icons.copy_rounded,
                iconPosition: Position.left,
                foregroundColor: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.primary : Colors.white,
                textStyle: GoogleFonts.baloo2(
                  fontWeight: Weight.semiBold,
                  fontSize: 14,
                ),
                height: 40,
                onPressed: () {
                  ///TODO: Copiar o link do palpite
                  Clipboard.setData(ClipboardData(text: link));
                  ComandaSnackBarService.show('O link foi copiado para a área de transferência.');
                },
              ),
            ),
          },
        ],
      ),
    );
  }
}