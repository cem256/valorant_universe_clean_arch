import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:valorant_universe_remastered/core/extensions/context_extension.dart';
import 'package:valorant_universe_remastered/core/locale/locale_keys.g.dart';
import 'package:valorant_universe_remastered/core/router/app_router.gr.dart';
import 'package:valorant_universe_remastered/core/widgets/icons/custom_icons.dart';

@RoutePage()
class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        AgentsRoute(),
        MapsRoute(),
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
              title: Text(LocaleKeys.common_agents.tr()),
              icon: const Icon(CustomIcons.agent),
            ),
            SalomonBottomBarItem(
              title: Text(LocaleKeys.common_maps.tr()),
              icon: const Icon(CustomIcons.map),
            ),
            SalomonBottomBarItem(
              title: Text(LocaleKeys.common_weapons.tr()),
              icon: const Icon(CustomIcons.weapon),
            ),
          ],
        );
      },
    );
  }
}
