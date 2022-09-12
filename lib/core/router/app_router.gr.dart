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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../feature/_navbar/view/navbar_view.dart' as _i1;
import '../../feature/agent_details/view/agent_details_view.dart' as _i2;
import '../../feature/agents/domain/entities/agent/agent_entity.dart' as _i8;
import '../../feature/agents/presentation/view/agents_view.dart' as _i4;
import '../../feature/weapon_details/view/weapon_details_view.dart' as _i3;
import '../../feature/weapons/domain/entities/weapon/weapon_entity.dart' as _i9;
import '../../feature/weapons/presentation/view/weapons_view.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    NavbarRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NavbarView());
    },
    AgentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AgentDetailsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.AgentDetailsView(key: args.key, agent: args.agent));
    },
    WeaponDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WeaponDetailsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.WeaponDetailsView(key: args.key, weapon: args.weapon));
    },
    AgentsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AgentsView());
    },
    WeaponsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WeaponsView());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(NavbarRoute.name, path: '/', children: [
          _i6.RouteConfig(AgentsRoute.name, path: '', parent: NavbarRoute.name),
          _i6.RouteConfig(WeaponsRoute.name,
              path: 'weapons-view', parent: NavbarRoute.name)
        ]),
        _i6.RouteConfig(AgentDetailsRoute.name, path: '/agent-details-view'),
        _i6.RouteConfig(WeaponDetailsRoute.name, path: '/weapon-details-view')
      ];
}

/// generated route for
/// [_i1.NavbarView]
class NavbarRoute extends _i6.PageRouteInfo<void> {
  const NavbarRoute({List<_i6.PageRouteInfo>? children})
      : super(NavbarRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavbarRoute';
}

/// generated route for
/// [_i2.AgentDetailsView]
class AgentDetailsRoute extends _i6.PageRouteInfo<AgentDetailsRouteArgs> {
  AgentDetailsRoute({_i7.Key? key, required _i8.AgentEntity agent})
      : super(AgentDetailsRoute.name,
            path: '/agent-details-view',
            args: AgentDetailsRouteArgs(key: key, agent: agent));

  static const String name = 'AgentDetailsRoute';
}

class AgentDetailsRouteArgs {
  const AgentDetailsRouteArgs({this.key, required this.agent});

  final _i7.Key? key;

  final _i8.AgentEntity agent;

  @override
  String toString() {
    return 'AgentDetailsRouteArgs{key: $key, agent: $agent}';
  }
}

/// generated route for
/// [_i3.WeaponDetailsView]
class WeaponDetailsRoute extends _i6.PageRouteInfo<WeaponDetailsRouteArgs> {
  WeaponDetailsRoute({_i7.Key? key, required _i9.WeaponEntity weapon})
      : super(WeaponDetailsRoute.name,
            path: '/weapon-details-view',
            args: WeaponDetailsRouteArgs(key: key, weapon: weapon));

  static const String name = 'WeaponDetailsRoute';
}

class WeaponDetailsRouteArgs {
  const WeaponDetailsRouteArgs({this.key, required this.weapon});

  final _i7.Key? key;

  final _i9.WeaponEntity weapon;

  @override
  String toString() {
    return 'WeaponDetailsRouteArgs{key: $key, weapon: $weapon}';
  }
}

/// generated route for
/// [_i4.AgentsView]
class AgentsRoute extends _i6.PageRouteInfo<void> {
  const AgentsRoute() : super(AgentsRoute.name, path: '');

  static const String name = 'AgentsRoute';
}

/// generated route for
/// [_i5.WeaponsView]
class WeaponsRoute extends _i6.PageRouteInfo<void> {
  const WeaponsRoute() : super(WeaponsRoute.name, path: 'weapons-view');

  static const String name = 'WeaponsRoute';
}
