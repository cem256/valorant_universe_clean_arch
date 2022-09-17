import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/repositories/weapon_repository_imp.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon_stats/weapon_stats_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/presentation/bloc/weapons_bloc.dart';

class MockWeaponRepositoryImp extends Mock implements WeaponRepositoryImp {}

void main() {
  late WeaponsBloc weaponsBloc;
  late MockWeaponRepositoryImp mockWeaponRepository;
  late List<WeaponEntity> tWeaponEntities;

  setUp(() {
    mockWeaponRepository = MockWeaponRepositoryImp();
    weaponsBloc = WeaponsBloc(weaponRepository: mockWeaponRepository);

    tWeaponEntities = [
      const WeaponEntity(
        displayName: "Test DisplayName",
        category: "Test Category",
        displayIcon: "Test DisplayIcon",
        weaponStats: WeaponStatsEntity(
          fireRate: "10",
          magazineSize: "10",
          reloadTimeSeconds: "10",
          damageRanges: [],
        ),
      ),
    ];
  });

  group("Weapons Bloc Tests", () {
    test("Initial value of the 'status' variable must be 'PageStatus.initial' at start", () {
      expect(weaponsBloc.state.status, PageStatus.initial);
    });

    test("Default value of the 'status' variable must be 'PageStatus.initial' at start", () {
      expect(weaponsBloc.state.status, PageStatus.initial);
    });
    test("Default value of the 'weapons' variable must be '[]' at start", () {
      expect(weaponsBloc.state.weapons, []);
    });

    blocTest(
      "Fetch all weapons error case test",
      setUp: () {
        when(() => mockWeaponRepository.fetchAllWeapons()).thenAnswer(
          (_) async => const Left(ApiFailure.unknownFailure()),
        );
      },
      build: () => weaponsBloc,
      act: (bloc) => bloc.add(const WeaponsFetched()),
      expect: () => [
        const WeaponsState(status: PageStatus.loading),
        const WeaponsState(
          status: PageStatus.failure,
          failure: ApiFailure.unknownFailure(),
        ),
      ],
    );

    blocTest(
      "Fetch all weapons success case test",
      setUp: () {
        when(() => mockWeaponRepository.fetchAllWeapons()).thenAnswer(
          (_) async => Right(tWeaponEntities),
        );
      },
      build: () => weaponsBloc,
      act: (bloc) => bloc.add(const WeaponsFetched()),
      expect: () => [
        const WeaponsState(status: PageStatus.loading),
        WeaponsState(
          weapons: tWeaponEntities,
          status: PageStatus.success,
        ),
      ],
    );
  });
}
