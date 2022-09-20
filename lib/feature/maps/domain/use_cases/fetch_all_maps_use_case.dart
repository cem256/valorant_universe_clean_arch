import 'package:dartz/dartz.dart';

import '../../../../core/failure/api_failure.dart';
import '../entities/map_entity.dart';
import '../repositories/map_repository.dart';

class FetchAllMapsUseCase {
  FetchAllMapsUseCase({required this.mapRepository});

  final MapRepository mapRepository;

  Future<Either<ApiFailure, List<MapEntity>>> call() {
    return mapRepository.fetchAllMaps();
  }
}
