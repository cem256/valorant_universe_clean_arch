import 'package:dartz/dartz.dart';

import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/repositories/map_repository.dart';

class FetchAllMapsUseCase {
  FetchAllMapsUseCase({required this.mapRepository});

  final MapRepository mapRepository;

  Future<Either<ApiFailure, List<MapEntity>>> call() {
    return mapRepository.fetchAllMaps();
  }
}
