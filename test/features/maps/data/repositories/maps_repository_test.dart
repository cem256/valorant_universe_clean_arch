import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/core/network/network_info.dart';

import 'package:valorant_universe_remastered/feature/maps/data/data_sources/remote/maps_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/maps/data/model/map_model.dart';
import 'package:valorant_universe_remastered/feature/maps/data/repositories/map_repository_imp.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/repositories/map_repository.dart';

class MockMapsRemoteDataSource extends Mock implements MapsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockMapModel extends Mock implements MapModel {}

void main() {
  late MockMapsRemoteDataSource mockMapsRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MapRepository mapRepository;
  late List<MockMapModel> mockMapModel;

  setUp(() {
    mockMapsRemoteDataSource = MockMapsRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mapRepository = MapRepositoryImp(
      mapsRemoteDataSource: mockMapsRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
    mockMapModel = List.generate(10, (index) => MockMapModel());
  });
  group('Checks the device connection', () {
    test('Device is online', () {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('Device is offline', () {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
  });

  group('Fetch maps', () {
    test('Should return list of map entities when there is no exception', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockMapsRemoteDataSource.fetchMaps()).thenAnswer((_) async => mockMapModel);
      final result = await mapRepository.fetchAllMaps();

      verify(() => mockMapsRemoteDataSource.fetchMaps());
      expect(result, isA<Right<Failure, List<MapEntity>>>());
    });
  });

  test('should return Failure when there is an exception', () async {
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockMapsRemoteDataSource.fetchMaps()).thenThrow(Exception());
    final result = await mapRepository.fetchAllMaps();

    verify(() => mockMapsRemoteDataSource.fetchMaps());
    expect(result, isA<Left<Failure, List<MapEntity>>>());
  });
}
