import 'package:dartz/dartz.dart';

import '../../../../core/failure/api_failure.dart';
import '../entities/map_entity.dart';

abstract class MapRepository {
  Future<Either<ApiFailure, List<MapEntity>>> fetchAllMaps();
}
