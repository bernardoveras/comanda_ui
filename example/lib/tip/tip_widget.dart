import 'package:comanda_ui/comanda_ui.dart';
import 'package:example/tip/tip_info.dart';
import 'package:example/tip/tip_result.dart';
import 'package:example/tip/tip_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/component_card.dart';

class TipSkeletonWidget extends StatelessWidget {
  const TipSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentCard(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 20,
              children: const [
                // Mercado
                TipInfoShimmer(
                  firstWidth: 65,
                  secondWidth: 100,
                ),
                //Tempo
                TipInfoShimmer(
                  firstWidth: 50,
                  secondWidth: 70,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 20,
              children: const [
                //Jogo
                TipInfoShimmer(
                  firstWidth: 50,
                  secondWidth: 165,
                ),
                // Odd Sugerida
                TipInfoShimmer(
                  firstWidth: 95,
                  secondWidth: 50,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          //Observação
          const TipInfoShimmer(
            firstWidth: 90,
            secondWidth: 200,
          ),
          const SizedBox(height: 20),
          //Resultado
          const TipInfoShimmer(
            firstWidth: 70,
            secondWidth: 90,
            secondHeight: 35,
          ),
          const SizedBox(height: 20),
          // Ir para Bet365
          const TipInfoShimmer(
            secondWidth: double.infinity,
            secondHeight: 45,
            hideFirst: true,
          ),
        ],
      ),
    );
  }
}

class TipInfoShimmer extends StatelessWidget {
  const TipInfoShimmer({
    Key? key,
    this.firstWidth = 65,
    this.firstHeight = 14,
    this.secondWidth = 100,
    this.secondHeight = 14,
    this.hideFirst = false,
  }) : super(key: key);

  final double firstWidth;
  final double firstHeight;

  final double secondWidth;
  final double secondHeight;

  final bool hideFirst;

  Color _shimmerColor(BuildContext context) => Theme.of(context).brightness == Brightness.light ? Color(0xFFDFDFDF) : Colors.grey.withOpacity(0.1);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hideFirst == false) ...{
          Container(
            width: firstWidth,
            height: firstHeight,
            decoration: BoxDecoration(
              color: _shimmerColor(context),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 10),
        },
        Container(
          width: secondWidth,
          height: secondHeight,
          decoration: BoxDecoration(
            color: _shimmerColor(context),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}

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
    this.adminMode = false,
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
                  ComandaModalService.show(
                    title: 'Deseja sair da sua conta?',
                    description: 'Caso você sair da sua conta, irá perder o histórico de cliques.',
                    primaryButtonText: 'Sair da conta',
                    secondaryButtonText: 'Não',

                  );
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
