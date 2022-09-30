import 'package:auto_route/auto_route.dart';

import '../../feature/_navbar/view/navbar_view.dart';
import '../../feature/agent_details/view/agent_details_view.dart';
import '../../feature/agents/presentation/view/agents_view.dart';
import '../../feature/map_detail/view/map_detail_view.dart';
import '../../feature/maps/presentation/view/maps_view.dart';
import '../../feature/weapon_details/view/weapon_details_view.dart';
import '../../feature/weapons/presentation/view/weapons_view.dart';
import 'wrappers/agents_wrapper.dart';
import 'wrappers/maps_wrapper.dart';
import 'wrappers/weapons_wrapper.dart';

@MaterialAutoRouter(
  replaceInRouteName: "View,Route",
  preferRelativeImports: true,
  routes: <AutoRoute>[
    AutoRoute(
      page: NavbarView,
      initial: true,
      children: [
        AutoRoute(
          page: AgentsWrapper,
          name: "AgentsRouter",
          initial: true,
          children: [
            AutoRoute(page: AgentsView, initial: true),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          page: MapsWrapper,
          name: "MapsRouter",
          children: [
            AutoRoute(page: MapsView, initial: true),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          page: WeaponsWrapper,
          name: "WeaponsRouter",
          children: [
            AutoRoute(page: WeaponsView, initial: true),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
    AutoRoute(page: AgentDetailsView),
    AutoRoute(page: MapDetailView),
    AutoRoute(page: WeaponDetailsView),
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $AppRouter {}
