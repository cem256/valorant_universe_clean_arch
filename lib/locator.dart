import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:valorant_universe_remastered/core/network/network_client.dart';
import 'package:valorant_universe_remastered/core/network/network_info.dart';
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

abstract final class Locator {
  /// [GetIt] instance
  static final instance = GetIt.instance;

  static Future<void> locateServices({required String baseUrl}) async {
    // Features - Agents
    // Bloc
    instance
      ..registerFactory(
        () => AgentsBloc(
          fetchAllAgentsUseCase: instance(),
          sortAgentUseCase: instance(),
        ),
      )

      // Use cases
      ..registerFactory(
        () => FetchAllAgentsUseCase(
          agentRepository: instance(),
        ),
      )
      ..registerFactory(
        () => SortAgentUseCase(
          agentRepository: instance(),
        ),
      )

      // Repository
      ..registerFactory<AgentRepository>(
        () => AgentRepositoryImp(
          agentsRemoteDataSource: instance(),
          networkInfo: instance(),
        ),
      )

      // Data sources
      ..registerFactory(
        () => AgentsRemoteDataSource(networkClient: instance()),
      )

      // Features - Weapons
      // Bloc
      ..registerFactory(
        () => WeaponsBloc(
          fetchAllWeaponsUseCase: instance(),
        ),
      )

      // Use cases
      ..registerFactory(
        () => FetchAllWeaponsUseCase(
          weaponRepository: instance(),
        ),
      )

      // Repository
      ..registerFactory<WeaponRepository>(
        () => WeaponRepositoryImp(
          weaponsRemoteDataSource: instance(),
          networkInfo: instance(),
        ),
      )

      // Data sources
      ..registerFactory(
        () => WeaponsRemoteDataSource(networkClient: instance()),
      )

      // Features - Maps
      // Bloc
      ..registerFactory(
        () => MapsBloc(
          fetchAllMapsUseCase: instance(),
        ),
      )

      // Use cases
      ..registerFactory(
        () => FetchAllMapsUseCase(
          mapRepository: instance(),
        ),
      )

      // Repository
      ..registerFactory<MapRepository>(
        () => MapRepositoryImp(
          mapsRemoteDataSource: instance(),
          networkInfo: instance(),
        ),
      )

      // Data sources
      ..registerFactory(
        () => MapsRemoteDataSource(networkClient: instance()),
      )

      // Core
      ..registerLazySingleton(
        InternetConnectionChecker.new,
      )
      ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(
          connectionChecker: instance(),
        ),
      )
      ..registerLazySingleton(
        () => NetworkClient(dio: instance(), baseUrl: baseUrl),
      )
      ..registerFactory(Dio.new);
  }
}
