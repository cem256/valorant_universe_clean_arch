import 'package:auto_route/auto_route.dart';

import '../../feature/_navbar/view/navbar_view.dart';
import '../../feature/agent_details/view/agent_details_view.dart';
import '../../feature/agents/presentation/view/agents_view.dart';
import '../../feature/weapon_details/view/weapon_details_view.dart';
import '../../feature/weapons/presentation/view/weapons_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    MaterialRoute(
      page: NavbarView,
      initial: true,
      children: [
        MaterialRoute(page: AgentsView, initial: true),
        MaterialRoute(page: WeaponsView),
      ],
    ),
    MaterialRoute(page: AgentDetailsView),
    MaterialRoute(page: WeaponDetailsView),
  ],
)
class $AppRouter {}
