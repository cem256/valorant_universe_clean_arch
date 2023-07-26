import 'package:dartz/dartz.dart';

import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';

abstract interface class MapRepository {
  Future<Either<Failure, List<MapEntity>>> fetchAllMaps();
}
