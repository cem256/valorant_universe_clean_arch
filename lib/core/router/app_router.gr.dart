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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../feature/_navbar/view/navbar_view.dart' as _i1;
import '../../feature/agent_details/view/agent_details_view.dart' as _i6;
import '../../feature/agents/domain/entities/agent/agent_entity.dart' as _i13;
import '../../feature/agents/presentation/view/agents_view.dart' as _i5;
import '../../feature/map_detail/view/map_detail_view.dart' as _i8;
import '../../feature/maps/domain/entities/map_entity.dart' as _i14;
import '../../feature/maps/presentation/view/maps_view.dart' as _i7;
import '../../feature/weapon_details/view/weapon_details_view.dart' as _i10;
import '../../feature/weapons/domain/entities/weapon/weapon_entity.dart'
    as _i15;
import '../../feature/weapons/presentation/view/weapons_view.dart' as _i9;
import 'wrappers/agents_wrapper.dart' as _i2;
import 'wrappers/maps_wrapper.dart' as _i3;
import 'wrappers/weapons_wrapper.dart' as _i4;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    NavbarRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NavbarView());
    },
    AgentsRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.WrappedRoute(child: _i2.AgentsWrapper()));
    },
    MapsRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.WrappedRoute(child: _i3.MapsWrapper()));
    },
    WeaponsRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.WrappedRoute(child: _i4.WeaponsWrapper()));
    },
    AgentsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AgentsView());
    },
    AgentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AgentDetailsRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.AgentDetailsView(key: args.key, agent: args.agent));
    },
    MapsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.MapsView());
    },
    MapDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MapDetailRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.MapDetailView(key: args.key, map: args.map));
    },
    WeaponsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.WeaponsView());
    },
    WeaponDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WeaponDetailsRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.WeaponDetailsView(key: args.key, weapon: args.weapon));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(NavbarRoute.name, path: '/', children: [
          _i11.RouteConfig(AgentsRouter.name,
              path: '',
              parent: NavbarRoute.name,
              children: [
                _i11.RouteConfig(AgentsRoute.name,
                    path: '', parent: AgentsRouter.name),
                _i11.RouteConfig(AgentDetailsRoute.name,
                    path: 'agent-details-view', parent: AgentsRouter.name),
                _i11.RouteConfig('*#redirect',
                    path: '*',
                    parent: AgentsRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i11.RouteConfig(MapsRouter.name,
              path: 'maps-wrapper',
              parent: NavbarRoute.name,
              children: [
                _i11.RouteConfig(MapsRoute.name,
                    path: '', parent: MapsRouter.name),
                _i11.RouteConfig(MapDetailRoute.name,
                    path: 'map-detail-view', parent: MapsRouter.name),
                _i11.RouteConfig('*#redirect',
                    path: '*',
                    parent: MapsRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i11.RouteConfig(WeaponsRouter.name,
              path: 'weapons-wrapper',
              parent: NavbarRoute.name,
              children: [
                _i11.RouteConfig(WeaponsRoute.name,
                    path: '', parent: WeaponsRouter.name),
                _i11.RouteConfig(WeaponDetailsRoute.name,
                    path: 'weapon-details-view', parent: WeaponsRouter.name),
                _i11.RouteConfig('*#redirect',
                    path: '*',
                    parent: WeaponsRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.NavbarView]
class NavbarRoute extends _i11.PageRouteInfo<void> {
  const NavbarRoute({List<_i11.PageRouteInfo>? children})
      : super(NavbarRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavbarRoute';
}

/// generated route for
/// [_i2.AgentsWrapper]
class AgentsRouter extends _i11.PageRouteInfo<void> {
  const AgentsRouter({List<_i11.PageRouteInfo>? children})
      : super(AgentsRouter.name, path: '', initialChildren: children);

  static const String name = 'AgentsRouter';
}

/// generated route for
/// [_i3.MapsWrapper]
class MapsRouter extends _i11.PageRouteInfo<void> {
  const MapsRouter({List<_i11.PageRouteInfo>? children})
      : super(MapsRouter.name, path: 'maps-wrapper', initialChildren: children);

  static const String name = 'MapsRouter';
}

/// generated route for
/// [_i4.WeaponsWrapper]
class WeaponsRouter extends _i11.PageRouteInfo<void> {
  const WeaponsRouter({List<_i11.PageRouteInfo>? children})
      : super(WeaponsRouter.name,
            path: 'weapons-wrapper', initialChildren: children);

  static const String name = 'WeaponsRouter';
}

/// generated route for
/// [_i5.AgentsView]
class AgentsRoute extends _i11.PageRouteInfo<void> {
  const AgentsRoute() : super(AgentsRoute.name, path: '');

  static const String name = 'AgentsRoute';
}

/// generated route for
/// [_i6.AgentDetailsView]
class AgentDetailsRoute extends _i11.PageRouteInfo<AgentDetailsRouteArgs> {
  AgentDetailsRoute({_i12.Key? key, required _i13.AgentEntity agent})
      : super(AgentDetailsRoute.name,
            path: 'agent-details-view',
            args: AgentDetailsRouteArgs(key: key, agent: agent));

  static const String name = 'AgentDetailsRoute';
}

class AgentDetailsRouteArgs {
  const AgentDetailsRouteArgs({this.key, required this.agent});

  final _i12.Key? key;

  final _i13.AgentEntity agent;

  @override
  String toString() {
    return 'AgentDetailsRouteArgs{key: $key, agent: $agent}';
  }
}

/// generated route for
/// [_i7.MapsView]
class MapsRoute extends _i11.PageRouteInfo<void> {
  const MapsRoute() : super(MapsRoute.name, path: '');

  static const String name = 'MapsRoute';
}

/// generated route for
/// [_i8.MapDetailView]
class MapDetailRoute extends _i11.PageRouteInfo<MapDetailRouteArgs> {
  MapDetailRoute({_i12.Key? key, required _i14.MapEntity map})
      : super(MapDetailRoute.name,
            path: 'map-detail-view',
            args: MapDetailRouteArgs(key: key, map: map));

  static const String name = 'MapDetailRoute';
}

class MapDetailRouteArgs {
  const MapDetailRouteArgs({this.key, required this.map});

  final _i12.Key? key;

  final _i14.MapEntity map;

  @override
  String toString() {
    return 'MapDetailRouteArgs{key: $key, map: $map}';
  }
}

/// generated route for
/// [_i9.WeaponsView]
class WeaponsRoute extends _i11.PageRouteInfo<void> {
  const WeaponsRoute() : super(WeaponsRoute.name, path: '');

  static const String name = 'WeaponsRoute';
}

/// generated route for
/// [_i10.WeaponDetailsView]
class WeaponDetailsRoute extends _i11.PageRouteInfo<WeaponDetailsRouteArgs> {
  WeaponDetailsRoute({_i12.Key? key, required _i15.WeaponEntity weapon})
      : super(WeaponDetailsRoute.name,
            path: 'weapon-details-view',
            args: WeaponDetailsRouteArgs(key: key, weapon: weapon));

  static const String name = 'WeaponDetailsRoute';
}

class WeaponDetailsRouteArgs {
  const WeaponDetailsRouteArgs({this.key, required this.weapon});

  final _i12.Key? key;

  final _i15.WeaponEntity weapon;

  @override
  String toString() {
    return 'WeaponDetailsRouteArgs{key: $key, weapon: $weapon}';
  }
}
