// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i10;
import 'package:valorant_universe_remastered/feature/_navbar/view/navbar_view.dart'
    as _i7;
import 'package:valorant_universe_remastered/feature/agent_details/view/agent_details_view.dart'
    as _i6;
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart'
    as _i12;
import 'package:valorant_universe_remastered/feature/agents/presentation/view/agents_view.dart'
    as _i3;
import 'package:valorant_universe_remastered/feature/map_detail/view/map_detail_view.dart'
    as _i5;
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart'
    as _i11;
import 'package:valorant_universe_remastered/feature/maps/presentation/view/maps_view.dart'
    as _i1;
import 'package:valorant_universe_remastered/feature/weapon_details/view/weapon_details_view.dart'
    as _i2;
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart'
    as _i9;
import 'package:valorant_universe_remastered/feature/weapons/presentation/view/weapons_view.dart'
    as _i4;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MapsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MapsView(),
      );
    },
    WeaponDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WeaponDetailsRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.WeaponDetailsView(
          weapon: args.weapon,
          key: args.key,
        ),
      );
    },
    AgentsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AgentsView(),
      );
    },
    WeaponsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WeaponsView(),
      );
    },
    MapDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MapDetailRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MapDetailView(
          map: args.map,
          key: args.key,
        ),
      );
    },
    AgentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AgentDetailsRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.AgentDetailsView(
          agent: args.agent,
          key: args.key,
        ),
      );
    },
    NavbarRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NavbarView(),
      );
    },
  };
}

/// generated route for
/// [_i1.MapsView]
class MapsRoute extends _i8.PageRouteInfo<void> {
  const MapsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MapsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WeaponDetailsView]
class WeaponDetailsRoute extends _i8.PageRouteInfo<WeaponDetailsRouteArgs> {
  WeaponDetailsRoute({
    required _i9.WeaponEntity weapon,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          WeaponDetailsRoute.name,
          args: WeaponDetailsRouteArgs(
            weapon: weapon,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WeaponDetailsRoute';

  static const _i8.PageInfo<WeaponDetailsRouteArgs> page =
      _i8.PageInfo<WeaponDetailsRouteArgs>(name);
}

class WeaponDetailsRouteArgs {
  const WeaponDetailsRouteArgs({
    required this.weapon,
    this.key,
  });

  final _i9.WeaponEntity weapon;

  final _i10.Key? key;

  @override
  String toString() {
    return 'WeaponDetailsRouteArgs{weapon: $weapon, key: $key}';
  }
}

/// generated route for
/// [_i3.AgentsView]
class AgentsRoute extends _i8.PageRouteInfo<void> {
  const AgentsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AgentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgentsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WeaponsView]
class WeaponsRoute extends _i8.PageRouteInfo<void> {
  const WeaponsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WeaponsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeaponsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MapDetailView]
class MapDetailRoute extends _i8.PageRouteInfo<MapDetailRouteArgs> {
  MapDetailRoute({
    required _i11.MapEntity map,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          MapDetailRoute.name,
          args: MapDetailRouteArgs(
            map: map,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MapDetailRoute';

  static const _i8.PageInfo<MapDetailRouteArgs> page =
      _i8.PageInfo<MapDetailRouteArgs>(name);
}

class MapDetailRouteArgs {
  const MapDetailRouteArgs({
    required this.map,
    this.key,
  });

  final _i11.MapEntity map;

  final _i10.Key? key;

  @override
  String toString() {
    return 'MapDetailRouteArgs{map: $map, key: $key}';
  }
}

/// generated route for
/// [_i6.AgentDetailsView]
class AgentDetailsRoute extends _i8.PageRouteInfo<AgentDetailsRouteArgs> {
  AgentDetailsRoute({
    required _i12.AgentEntity agent,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AgentDetailsRoute.name,
          args: AgentDetailsRouteArgs(
            agent: agent,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AgentDetailsRoute';

  static const _i8.PageInfo<AgentDetailsRouteArgs> page =
      _i8.PageInfo<AgentDetailsRouteArgs>(name);
}

class AgentDetailsRouteArgs {
  const AgentDetailsRouteArgs({
    required this.agent,
    this.key,
  });

  final _i12.AgentEntity agent;

  final _i10.Key? key;

  @override
  String toString() {
    return 'AgentDetailsRouteArgs{agent: $agent, key: $key}';
  }
}

/// generated route for
/// [_i7.NavbarView]
class NavbarRoute extends _i8.PageRouteInfo<void> {
  const NavbarRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NavbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavbarRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
