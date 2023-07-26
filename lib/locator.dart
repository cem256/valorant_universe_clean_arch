import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:valorant_universe_remastered/core/locale/locale_manager.dart';
import 'package:valorant_universe_remastered/core/network/network_info.dart';
import 'package:valorant_universe_remastered/core/network/network_manager.dart';
import 'package:valorant_universe_remastered/core/theme/theme_manager.dart';
import 'package:valorant_universe_remastered/feature/agents/data/data_sources/remote/agents_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/agents/data/repositories/agent_repository_imp.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/repositories/agent_repository.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/use_cases/fetch_all_agents_use_case.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/use_cases/sort_agents_use_case.dart';
import 'package:valorant_universe_remastered/feature/agents/presentation/bloc/agents_bloc.dart';
import 'package:valorant_universe_remastered/feature/maps/data/data_sources/remote/maps_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/maps/data/repositories/map_repository_imp.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/repositories/map_repository.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/use_cases/fetch_all_maps_use_case.dart';
import 'package:valorant_universe_remastered/feature/maps/presentation/bloc/maps_bloc.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/data_sources/remote/weapons_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/repositories/weapon_repository_imp.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/repositories/weapon_repository.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/use_cases/fetch_all_weapons_use_case.dart';
import 'package:valorant_universe_remastered/feature/weapons/presentation/bloc/weapons_bloc.dart';

// Global service locator
final getIt = GetIt.instance;

void initServices() {
  // Features - Agents
  // Bloc
  getIt
    ..registerFactory(
      () => AgentsBloc(
        fetchAllAgentsUseCase: getIt(),
        sortAgentUseCase: getIt(),
      ),
    )

    // Use cases
    ..registerLazySingleton(
      () => FetchAllAgentsUseCase(
        agentRepository: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => SortAgentUseCase(
        agentRepository: getIt(),
      ),
    )

    // Repository
    ..registerLazySingleton<AgentRepository>(
      () => AgentRepositoryImp(
        agentsRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ),
    )

    // Data sources
    ..registerLazySingleton(
      () => AgentsRemoteDataSource(dio: getIt<NetworkManager>().dio),
    )

    // Features - Weapons
    // Bloc
    ..registerFactory(
      () => WeaponsBloc(
        fetchAllWeaponsUseCase: getIt(),
      ),
    )

    // Use cases
    ..registerLazySingleton(
      () => FetchAllWeaponsUseCase(
        weaponRepository: getIt(),
      ),
    )

    // Repository
    ..registerLazySingleton<WeaponRepository>(
      () => WeaponRepositoryImp(
        weaponsRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ),
    )

    // Data sources
    ..registerLazySingleton(
      () => WeaponsRemoteDataSource(dio: getIt<NetworkManager>().dio),
    )

    // Features - Maps
    // Bloc
    ..registerFactory(
      () => MapsBloc(
        fetchAllMapsUseCase: getIt(),
      ),
    )

    // Use cases
    ..registerLazySingleton(
      () => FetchAllMapsUseCase(
        mapRepository: getIt(),
      ),
    )

    // Repository
    ..registerLazySingleton<MapRepository>(
      () => MapRepositoryImp(
        mapsRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ),
    )

    // Data sources
    ..registerLazySingleton(
      () => MapsRemoteDataSource(dio: getIt<NetworkManager>().dio),
    )

    // Core
    ..registerLazySingleton(
      InternetConnectionChecker.new,
    )
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(
        connectionChecker: getIt(),
      ),
    )
    ..registerLazySingleton(
      NetworkManager.new,
    )
    ..registerLazySingleton(
      ThemeManager.new,
    )
    ..registerLazySingleton(
      LocaleManager.new,
    );
}
