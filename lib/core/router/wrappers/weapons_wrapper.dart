import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/weapons/presentation/bloc/weapons_bloc.dart';
import '../../../locator.dart';

class WeaponsWrapper implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeaponsBloc>()..add(const WeaponsFetched()),
      child: const AutoRouter(),
    );
  }
}
