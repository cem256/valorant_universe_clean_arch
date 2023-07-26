import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:valorant_universe_remastered/core/exceptions/exceptions.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/core/network/network_info.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/repositories/weapon_repository.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/data_sources/remote/weapons_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/model/weapon/weapon_model.dart';

class WeaponRepositoryImp implements WeaponRepository {
  WeaponRepositoryImp({
    required this.weaponsRemoteDataSource,
    required this.networkInfo,
  });

  final WeaponsRemoteDataSource weaponsRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<ApiFailure, List<WeaponEntity>>> fetchAllWeapons() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await weaponsRemoteDataSource.fetchWeapons();

        return right(response.map((e) => e.toWeaponEntity()).toList());
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
