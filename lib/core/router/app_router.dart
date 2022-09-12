import 'package:auto_route/auto_route.dart';

import '../../feature/_navbar/presentation/view/navbar_view.dart';
import '../../feature/agents/presentation/view/agents_view.dart';
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
  ],
)
class $AppRouter {}
