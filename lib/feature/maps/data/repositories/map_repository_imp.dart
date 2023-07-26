import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:valorant_universe_remastered/app/errors/exceptions/exceptions.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/core/network/network_info.dart';
import 'package:valorant_universe_remastered/feature/maps/data/data_sources/remote/maps_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/maps/data/model/map_model.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/repositories/map_repository.dart';

class MapRepositoryImp implements MapRepository {
  MapRepositoryImp({required this.mapsRemoteDataSource, required this.networkInfo});

  final MapsRemoteDataSource mapsRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<MapEntity>>> fetchAllMaps() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await mapsRemoteDataSource.fetchMaps();

        return right(response.map((e) => e.toMapEntity()).toList());
      } on DioException catch (e) {
        return left(Failure.dioFailure(e.message));
      } on NullResponseException catch (_) {
        return left(const Failure.nullResponseFailure());
      } catch (_) {
        return left(const Failure.unknownFailure());
      }
    } else {
      return left(const Failure.noConnectionFailure());
    }
  }
}
