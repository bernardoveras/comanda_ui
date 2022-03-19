import 'package:comanda_ui/shared/colors.dart';
import 'package:comanda_ui/shared/weight.dart';
import 'package:example/shared/utils/theme_preference.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComponentAppBar extends StatelessWidget {
  const ComponentAppBar({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120.0,
      pinned: true,
      floating: false,
      snap: false,
      toolbarHeight: 80,
      titleSpacing: 80,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.primary : ComandaBetColors.dark50,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(24),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: GoogleFonts.baloo2(
                fontWeight: Weight.bold(),
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: ThemePreference.theme,
              builder: (context, Brightness theme, _) => Tooltip(
                message: 'Alterar para ${theme == Brightness.dark ? 'light' : 'dark'} mode.',
                child: Material(
                  elevation: 0,
                  color: theme == Brightness.light ? ComandaBetColors.primaryDark : ComandaBetColors.dark100,
                  type: MaterialType.circle,
                  child: InkWell(
                    onTap: () => ThemePreference.changeTheme(),
                    borderRadius: BorderRadius.circular(100),
                    splashColor: Colors.white.withOpacity(0.10),
                    highlightColor: Colors.white.withOpacity(0.10),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Icon(
                        theme == Brightness.dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
