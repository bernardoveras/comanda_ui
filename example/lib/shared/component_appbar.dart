import 'package:comanda_ui/shared/colors.dart';
import 'package:comanda_ui/shared/weight.dart';
import 'package:example/shared/utils/theme_preference.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).brightness == Brightness.light ? ComandaBetColors.primary : ComandaBetColors.dark50,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(24),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: Weight.bold(),
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Material(
              elevation: 0,
              color: ComandaBetColors.primaryDark,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: () {
                  ThemePreference.changeTheme();
                },
                borderRadius: BorderRadius.circular(100),
                splashColor: Colors.white.withOpacity(0.10),
                highlightColor: Colors.white.withOpacity(0.10),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const Icon(
                    Icons.dark_mode_rounded,
                    color: Colors.white,
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
