import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/use_cases/fetch_all_maps_use_case.dart';
import 'package:valorant_universe_remastered/feature/maps/presentation/bloc/maps_bloc.dart';

class MockFetchAllMapsUseCase extends Mock implements FetchAllMapsUseCase {}

class MockMapEntity extends Mock implements MapEntity {}

void main() {
  late MapsBloc mapsBloc;
  late MockFetchAllMapsUseCase mockFetchAllMapsUseCase;
  late List<MockMapEntity> mockMapEntities;

  setUp(() {
    mockFetchAllMapsUseCase = MockFetchAllMapsUseCase();
    mapsBloc = MapsBloc(
      fetchAllMapsUseCase: mockFetchAllMapsUseCase,
    );
    mockMapEntities = List.generate(10, (index) => MockMapEntity());
  });

  group("Maps Bloc Tests", () {
    test("Initial value of the 'status' variable must be 'PageStatus.initial' at start", () {
      expect(mapsBloc.state.status, PageStatus.initial);
    });
    test("Default value of the 'status' variable must be 'PageStatus.initial' at start", () {
      expect(mapsBloc.state.status, PageStatus.initial);
    });
    test("Default value of the 'maps' variable must be '[]' at start", () {
      expect(mapsBloc.state.maps, []);
    });

    blocTest(
      "Fetch all maps error case test",
      setUp: () {
        when(() => mockFetchAllMapsUseCase()).thenAnswer(
          (_) async => const Left(
            ApiFailure.unknownFailure(),
          ),
        );
      },
      build: () => mapsBloc,
      act: (bloc) => bloc.add(const MapsFetched()),
      expect: () => [
        const MapsState(status: PageStatus.loading),
        const MapsState(
          status: PageStatus.failure,
          failure: ApiFailure.unknownFailure(),
        ),
      ],
    );

    blocTest(
      "Fetch all maps success case test",
      setUp: () {
        when(() => mockFetchAllMapsUseCase()).thenAnswer(
          (_) async => Right(mockMapEntities),
        );
      },
      build: () => mapsBloc,
      act: (bloc) => bloc.add(const MapsFetched()),
      expect: () => [
        const MapsState(status: PageStatus.loading),
        MapsState(
          maps: mockMapEntities,
          status: PageStatus.success,
        ),
      ],
    );
  });
}
