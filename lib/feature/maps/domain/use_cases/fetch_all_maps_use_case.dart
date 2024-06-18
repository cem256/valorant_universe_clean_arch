import 'package:fpdart/fpdart.dart';

import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/repositories/map_repository.dart';

class FetchAllMapsUseCase {
  FetchAllMapsUseCase({required this.mapRepository});

  final MapRepository mapRepository;

  Future<Either<Failure, List<MapEntity>>> call() {
    return mapRepository.fetchAllMaps();
  }
}
