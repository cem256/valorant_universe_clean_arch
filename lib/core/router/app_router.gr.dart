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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../feature/_navbar/view/navbar_view.dart' as _i1;
import '../../feature/agent_details/view/agent_details_view.dart' as _i2;
import '../../feature/agents/domain/entities/agent/agent_entity.dart' as _i10;
import '../../feature/agents/presentation/view/agents_view.dart' as _i5;
import '../../feature/map_detail/view/map_detail_view.dart' as _i3;
import '../../feature/maps/domain/entities/map_entity.dart' as _i11;
import '../../feature/maps/presentation/view/maps_view.dart' as _i6;
import '../../feature/weapon_details/view/weapon_details_view.dart' as _i4;
import '../../feature/weapons/domain/entities/weapon/weapon_entity.dart'
    as _i12;
import '../../feature/weapons/presentation/view/weapons_view.dart' as _i7;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    NavbarRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NavbarView());
    },
    AgentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AgentDetailsRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.AgentDetailsView(key: args.key, agent: args.agent));
    },
    MapDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MapDetailRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.MapDetailView(key: args.key, map: args.map));
    },
    WeaponDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WeaponDetailsRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.WeaponDetailsView(key: args.key, weapon: args.weapon));
    },
    AgentsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AgentsView());
    },
    MapsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.MapsView());
    },
    WeaponsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.WeaponsView());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(NavbarRoute.name, path: '/', children: [
          _i8.RouteConfig(AgentsRoute.name, path: '', parent: NavbarRoute.name),
          _i8.RouteConfig(MapsRoute.name,
              path: 'maps-view', parent: NavbarRoute.name),
          _i8.RouteConfig(WeaponsRoute.name,
              path: 'weapons-view', parent: NavbarRoute.name)
        ]),
        _i8.RouteConfig(AgentDetailsRoute.name, path: '/agent-details-view'),
        _i8.RouteConfig(MapDetailRoute.name, path: '/map-detail-view'),
        _i8.RouteConfig(WeaponDetailsRoute.name, path: '/weapon-details-view')
      ];
}

/// generated route for
/// [_i1.NavbarView]
class NavbarRoute extends _i8.PageRouteInfo<void> {
  const NavbarRoute({List<_i8.PageRouteInfo>? children})
      : super(NavbarRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavbarRoute';
}

/// generated route for
/// [_i2.AgentDetailsView]
class AgentDetailsRoute extends _i8.PageRouteInfo<AgentDetailsRouteArgs> {
  AgentDetailsRoute({_i9.Key? key, required _i10.AgentEntity agent})
      : super(AgentDetailsRoute.name,
            path: '/agent-details-view',
            args: AgentDetailsRouteArgs(key: key, agent: agent));

  static const String name = 'AgentDetailsRoute';
}

class AgentDetailsRouteArgs {
  const AgentDetailsRouteArgs({this.key, required this.agent});

  final _i9.Key? key;

  final _i10.AgentEntity agent;

  @override
  String toString() {
    return 'AgentDetailsRouteArgs{key: $key, agent: $agent}';
  }
}

/// generated route for
/// [_i3.MapDetailView]
class MapDetailRoute extends _i8.PageRouteInfo<MapDetailRouteArgs> {
  MapDetailRoute({_i9.Key? key, required _i11.MapEntity map})
      : super(MapDetailRoute.name,
            path: '/map-detail-view',
            args: MapDetailRouteArgs(key: key, map: map));

  static const String name = 'MapDetailRoute';
}

class MapDetailRouteArgs {
  const MapDetailRouteArgs({this.key, required this.map});

  final _i9.Key? key;

  final _i11.MapEntity map;

  @override
  String toString() {
    return 'MapDetailRouteArgs{key: $key, map: $map}';
  }
}

/// generated route for
/// [_i4.WeaponDetailsView]
class WeaponDetailsRoute extends _i8.PageRouteInfo<WeaponDetailsRouteArgs> {
  WeaponDetailsRoute({_i9.Key? key, required _i12.WeaponEntity weapon})
      : super(WeaponDetailsRoute.name,
            path: '/weapon-details-view',
            args: WeaponDetailsRouteArgs(key: key, weapon: weapon));

  static const String name = 'WeaponDetailsRoute';
}

class WeaponDetailsRouteArgs {
  const WeaponDetailsRouteArgs({this.key, required this.weapon});

  final _i9.Key? key;

  final _i12.WeaponEntity weapon;

  @override
  String toString() {
    return 'WeaponDetailsRouteArgs{key: $key, weapon: $weapon}';
  }
}

/// generated route for
/// [_i5.AgentsView]
class AgentsRoute extends _i8.PageRouteInfo<void> {
  const AgentsRoute() : super(AgentsRoute.name, path: '');

  static const String name = 'AgentsRoute';
}

/// generated route for
/// [_i6.MapsView]
class MapsRoute extends _i8.PageRouteInfo<void> {
  const MapsRoute() : super(MapsRoute.name, path: 'maps-view');

  static const String name = 'MapsRoute';
}

/// generated route for
/// [_i7.WeaponsView]
class WeaponsRoute extends _i8.PageRouteInfo<void> {
  const WeaponsRoute() : super(WeaponsRoute.name, path: 'weapons-view');

  static const String name = 'WeaponsRoute';
}
