import 'package:dartz/dartz.dart';

import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';

abstract class MapRepository {
  Future<Either<ApiFailure, List<MapEntity>>> fetchAllMaps();
}
