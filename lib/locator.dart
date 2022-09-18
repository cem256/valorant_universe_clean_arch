import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/locale/locale_manager.dart';
import 'core/network/network_info.dart';
import 'core/network/network_manager.dart';
import 'core/theme/theme_manager.dart';
import 'feature/agents/data/data_sources/remote/agents_remote_data_source.dart';
import 'feature/agents/data/repositories/agent_repository_imp.dart';
import 'feature/agents/domain/repositories/agent_repository.dart';
import 'feature/agents/domain/use_cases/fetch_all_agents_use_case.dart';
import 'feature/agents/domain/use_cases/sort_agents_use_case.dart';
import 'feature/agents/presentation/bloc/agents_bloc.dart';
import 'feature/weapons/data/data_sources/remote/weapons_remote_data_source.dart';
import 'feature/weapons/data/repositories/weapon_repository_imp.dart';
import 'feature/weapons/domain/repositories/weapon_repository.dart';
import 'feature/weapons/domain/use_cases/fetch_all_weapons_use_case.dart';
import 'feature/weapons/presentation/bloc/weapons_bloc.dart';

// Global service locator
final getIt = GetIt.instance;

void initServices() {
  // Features - Agents
  // Bloc
  getIt.registerFactory(
    () => AgentsBloc(
      fetchAllAgentsUseCase: getIt(),
      sortAgentUseCase: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => FetchAllAgentsUseCase(
      agentRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => SortAgentUseCase(
      agentRepository: getIt(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<AgentRepository>(
    () => AgentRepositoryImp(
      agentsRemoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton(
    () => AgentsRemoteDataSource(dio: getIt<NetworkManager>().dio),
  );

  // Features - Weapons
  // Bloc
  getIt.registerFactory(
    () => WeaponsBloc(
      fetchAllWeaponsUseCase: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => FetchAllWeaponsUseCase(
      weaponRepository: getIt(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<WeaponRepository>(
    () => WeaponRepositoryImp(
      weaponsRemoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton(
    () => WeaponsRemoteDataSource(dio: getIt<NetworkManager>().dio),
  );

  // Core
  getIt.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(
      connectionChecker: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => NetworkManager(),
  );
  getIt.registerLazySingleton(
    () => ThemeManager(),
  );
  getIt.registerLazySingleton(
    () => LocaleManager(),
  );
}
