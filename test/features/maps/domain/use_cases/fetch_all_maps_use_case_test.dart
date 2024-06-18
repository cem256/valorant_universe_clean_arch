import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/repositories/map_repository.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/use_cases/fetch_all_maps_use_case.dart';

class MockMapRepository extends Mock implements MapRepository {}

class MockMapEntity extends Mock implements MapEntity {}

void main() {
  late MockMapRepository mockMapRepository;
  late FetchAllMapsUseCase fetchAllMapsUseCase;
  late List<MockMapEntity> mockMapEntity;

  setUp(() {
    mockMapRepository = MockMapRepository();
    fetchAllMapsUseCase = FetchAllMapsUseCase(mapRepository: mockMapRepository);
    mockMapEntity = List.generate(10, (index) => MockMapEntity());
  });

  group('Fetch All Maps Use Case Test', () {
    test('Should return list of map entities when there is no exception', () async {
      when(() => mockMapRepository.fetchAllMaps()).thenAnswer((_) async => Right(mockMapEntity));
      final result = await fetchAllMapsUseCase();

      verify(() => fetchAllMapsUseCase());
      expect(result, isA<Right<Failure, List<MapEntity>>>());
    });

    test('Should return Failure when there is an exception', () async {
      when(() => mockMapRepository.fetchAllMaps()).thenAnswer((_) async => const Left(Failure.unknownFailure()));
      final result = await fetchAllMapsUseCase();

      verify(() => fetchAllMapsUseCase());
      expect(result, isA<Left<Failure, List<MapEntity>>>());
    });
  });
}
