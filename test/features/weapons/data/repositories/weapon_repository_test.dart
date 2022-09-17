import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/core/network/network_info.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/data_sources/remote/weapons_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/model/weapon/weapon_model.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/model/weapon_stats/weapon_stats_model.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/repositories/weapon_repository_imp.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/repositories/weapon_repository.dart';

class MockWeaponsRemoteDataSource extends Mock implements WeaponsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockWeaponsRemoteDataSource mockWeaponsRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late WeaponRepository weaponRepository;

  setUp(() {
    mockWeaponsRemoteDataSource = MockWeaponsRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    weaponRepository = WeaponRepositoryImp(
      weaponsRemoteDataSource: mockWeaponsRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
  group("Checks the device connection", () {
    test("Device is online", () {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test("Device is offline", () {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
  });

  final tWeaponModels = [
    const WeaponModel(
      displayName: "Test DisplayName",
      category: "Test Category",
      displayIcon: "Test DisplayIcon",
      weaponStats: WeaponStatsModel(
        fireRate: 10,
        magazineSize: 10,
        reloadTimeSeconds: 10,
        damageRanges: [],
      ),
    ),
  ];

  group("fetch weapons", () {
    test("should return list of weapon entities when there is no exception", () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockWeaponsRemoteDataSource.fetchWeapons()).thenAnswer((_) async => tWeaponModels);
      final result = await weaponRepository.fetchAllWeapons();

      verify(() => mockWeaponsRemoteDataSource.fetchWeapons());
      expect(result, isA<Right<ApiFailure, List<WeaponEntity>>>());
    });
  });

  test("should return ApiFailure when there is an exception", () async {
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockWeaponsRemoteDataSource.fetchWeapons()).thenThrow(Exception());
    final result = await weaponRepository.fetchAllWeapons();

    verify(() => mockWeaponsRemoteDataSource.fetchWeapons());
    expect(result, isA<Left<ApiFailure, List<WeaponEntity>>>());
  });
}
