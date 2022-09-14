import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/widgets/icons/custom_icons.dart';

class NavbarView extends StatelessWidget {
  const NavbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        AgentsRoute(),
        WeaponsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          itemShape: RoundedRectangleBorder(
            borderRadius: context.defaultBorderRadius,
          ),
          selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          selectedColorOpacity: 0.4,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              title: const Text("Agents"),
              icon: const Icon(CustomIcons.agent),
            ),
            SalomonBottomBarItem(
              title: const Text("Weapons"),
              icon: const Icon(CustomIcons.weapon),
            ),
          ],
        );
      },
    );
  }
}
