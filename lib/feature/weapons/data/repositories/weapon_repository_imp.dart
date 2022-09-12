import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/failure/api_failure.dart';
import '../../domain/entities/weapon/weapon_entity.dart';
import '../../domain/repositories/weapon_repository.dart';
import '../data_sources/remote/weapons_remote_data_source.dart';
import '../model/weapon/weapon_model.dart';

class WeaponRepositoryImp implements WeaponRepository {
  WeaponRepositoryImp(this.weaponsRemoteDataSource);

  final WeaponsRemoteDataSource weaponsRemoteDataSource;

  @override
  Future<Either<ApiFailure, List<WeaponEntity>>> fetchAllWeapons() async {
    try {
      final response = await weaponsRemoteDataSource.fetchWeapons();
      if (response == null) {
        return left(const ApiFailure.nullResponseFailure());
      }
      return right(response.map((e) => e.toWeaponEntity()).toList());
    } on DioException catch (_) {
      return left(const ApiFailure.dioFailure());
    } catch (_) {
      return left(const ApiFailure.unknownFailure());
    }
  }
}
