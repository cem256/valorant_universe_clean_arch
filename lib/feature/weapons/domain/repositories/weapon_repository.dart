import 'package:dartz/dartz.dart';

import '../../../../core/failure/api_failure.dart';
import '../entities/weapon/weapon_entity.dart';

abstract class WeaponRepository {
  Future<Either<ApiFailure, List<WeaponEntity>>> fetchAllWeapons();
}
