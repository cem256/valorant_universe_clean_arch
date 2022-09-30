import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/agents/presentation/bloc/agents_bloc.dart';
import '../../../locator.dart';

class AgentsWrapper implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AgentsBloc>()..add(const AgentsFetched()),
      child: const AutoRouter(),
    );
  }
}
