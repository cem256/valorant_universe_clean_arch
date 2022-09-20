import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/api_failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/map_entity.dart';
import '../../domain/repositories/map_repository.dart';
import '../data_sources/remote/maps_remote_data_source.dart';
import '../model/map_model.dart';

class MapRepositoryImp implements MapRepository {
  MapRepositoryImp({required this.mapsRemoteDataSource, required this.networkInfo});

  final MapsRemoteDataSource mapsRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<ApiFailure, List<MapEntity>>> fetchAllMaps() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await mapsRemoteDataSource.fetchMaps();

        return right(response.map((e) => e.toMapEntity()).toList());
      } on DioException catch (e) {
        return left(ApiFailure.dioFailure(e.message));
      } on NullResponseException catch (_) {
        return left(const ApiFailure.nullResponseFailure());
      } catch (_) {
        return left(const ApiFailure.unknownFailure());
      }
    } else {
      return left(const ApiFailure.noConnectionFailure());
    }
  }
}
