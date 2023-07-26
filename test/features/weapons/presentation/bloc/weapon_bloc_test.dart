import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/use_cases/fetch_all_weapons_use_case.dart';
import 'package:valorant_universe_remastered/feature/weapons/presentation/bloc/weapons_bloc.dart';

class MockFetchAllWeaponsUseCase extends Mock implements FetchAllWeaponsUseCase {}

class MockWeaponEntity extends Mock implements WeaponEntity {}

void main() {
  late WeaponsBloc weaponsBloc;
  late MockFetchAllWeaponsUseCase fetchAllWeaponsUseCase;
  late List<MockWeaponEntity> mockWeaponEntities;

  setUp(() {
    fetchAllWeaponsUseCase = MockFetchAllWeaponsUseCase();
    weaponsBloc = WeaponsBloc(fetchAllWeaponsUseCase: fetchAllWeaponsUseCase);
    mockWeaponEntities = List.generate(10, (index) => MockWeaponEntity());
  });

  group('Weapons Bloc Tests', () {
    test("Initial value of the 'status' variable must be 'PageStatus.initial' at start", () {
      expect(weaponsBloc.state.status, PageStatus.initial);
    });

    test("Default value of the 'status' variable must be 'PageStatus.initial' at start", () {
      expect(weaponsBloc.state.status, PageStatus.initial);
    });
    test("Default value of the 'weapons' variable must be '[]' at start", () {
      expect(weaponsBloc.state.weapons, <WeaponEntity>[]);
    });

    blocTest<WeaponsBloc, WeaponsState>(
      'Fetch all weapons error case test',
      setUp: () {
        when(() => fetchAllWeaponsUseCase()).thenAnswer(
          (_) async => const Left(Failure.unknownFailure()),
        );
      },
      build: () => weaponsBloc,
      act: (bloc) => bloc.add(const WeaponsFetched()),
      expect: () => [
        const WeaponsState(status: PageStatus.loading),
        const WeaponsState(
          status: PageStatus.failure,
          failure: Failure.unknownFailure(),
        ),
      ],
    );

    blocTest<WeaponsBloc, WeaponsState>(
      'Fetch all weapons success case test',
      setUp: () {
        when(() => fetchAllWeaponsUseCase()).thenAnswer(
          (_) async => Right(mockWeaponEntities),
        );
      },
      build: () => weaponsBloc,
      act: (bloc) => bloc.add(const WeaponsFetched()),
      expect: () => [
        const WeaponsState(status: PageStatus.loading),
        WeaponsState(
          weapons: mockWeaponEntities,
          status: PageStatus.success,
        ),
      ],
    );
  });
}
