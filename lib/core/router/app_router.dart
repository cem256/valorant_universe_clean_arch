import 'package:auto_route/auto_route.dart';

import '../../feature/agents/presentation/view/agents_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    MaterialRoute(initial: true, page: AgentsView),
  ],
)
class $AppRouter {}
