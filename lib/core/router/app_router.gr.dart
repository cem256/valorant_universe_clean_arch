// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../feature/_navbar/presentation/view/navbar_view.dart' as _i1;
import '../../feature/agents/presentation/view/agents_view.dart' as _i2;
import '../../feature/weapons/presentation/view/weapons_view.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    NavbarRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NavbarView());
    },
    AgentsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AgentsView());
    },
    WeaponsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.WeaponsView());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(NavbarRoute.name, path: '/', children: [
          _i4.RouteConfig(AgentsRoute.name, path: '', parent: NavbarRoute.name),
          _i4.RouteConfig(WeaponsRoute.name,
              path: 'weapons-view', parent: NavbarRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.NavbarView]
class NavbarRoute extends _i4.PageRouteInfo<void> {
  const NavbarRoute({List<_i4.PageRouteInfo>? children})
      : super(NavbarRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavbarRoute';
}

/// generated route for
/// [_i2.AgentsView]
class AgentsRoute extends _i4.PageRouteInfo<void> {
  const AgentsRoute() : super(AgentsRoute.name, path: '');

  static const String name = 'AgentsRoute';
}

/// generated route for
/// [_i3.WeaponsView]
class WeaponsRoute extends _i4.PageRouteInfo<void> {
  const WeaponsRoute() : super(WeaponsRoute.name, path: 'weapons-view');

  static const String name = 'WeaponsRoute';
}
