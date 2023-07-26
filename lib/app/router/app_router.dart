import 'package:auto_route/auto_route.dart';
import 'package:valorant_universe_remastered/app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(
          page: NavbarRoute.page,
          initial: true,
          children: [
            AdaptiveRoute(
              page: AgentsRoute.page,
              initial: true,
            ),
            AdaptiveRoute(
              page: WeaponsRoute.page,
            ),
            AdaptiveRoute(
              page: MapsRoute.page,
            ),
          ],
        ),
        AdaptiveRoute(page: AgentDetailsRoute.page),
        AdaptiveRoute(page: MapDetailRoute.page),
        AdaptiveRoute(page: WeaponDetailsRoute.page),
      ];
}
