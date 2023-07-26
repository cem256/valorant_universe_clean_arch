import 'package:dartz/dartz.dart';

import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';

abstract class WeaponRepository {
  Future<Either<ApiFailure, List<WeaponEntity>>> fetchAllWeapons();
}
