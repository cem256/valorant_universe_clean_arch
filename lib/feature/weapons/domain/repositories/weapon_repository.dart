import 'package:dartz/dartz.dart';

import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';

abstract class WeaponRepository {
  Future<Either<Failure, List<WeaponEntity>>> fetchAllWeapons();
}
