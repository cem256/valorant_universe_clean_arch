import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/repositories/weapon_repository.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/use_cases/fetch_all_weapons_use_case.dart';

class MockWeaponRepository extends Mock implements WeaponRepository {}

class MockWeaponEntity extends Mock implements WeaponEntity {}

void main() {
  late MockWeaponRepository mockWeaponRepository;
  late FetchAllWeaponsUseCase fetchAllWeaponsUseCase;
  late List<MockWeaponEntity> mockWeaponEntity;

  setUp(() {
    mockWeaponRepository = MockWeaponRepository();
    fetchAllWeaponsUseCase = FetchAllWeaponsUseCase(weaponRepository: mockWeaponRepository);
    mockWeaponEntity = List.generate(10, (index) => MockWeaponEntity());
  });

  group('Fetch All Weapons Use Case Test', () {
    test('Should return list of weapon entities when there is no exception', () async {
      when(() => mockWeaponRepository.fetchAllWeapons()).thenAnswer((_) async => Right(mockWeaponEntity));
      final result = await fetchAllWeaponsUseCase();

      verify(() => fetchAllWeaponsUseCase());
      expect(result, isA<Right<Failure, List<WeaponEntity>>>());
    });

    test('Should return Failure when there is an exception', () async {
      when(() => mockWeaponRepository.fetchAllWeapons()).thenAnswer((_) async => const Left(Failure.unknownFailure()));
      final result = await fetchAllWeaponsUseCase();

      verify(() => fetchAllWeaponsUseCase());
      expect(result, isA<Left<Failure, List<WeaponEntity>>>());
    });
  });
}
