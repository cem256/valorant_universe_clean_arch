import 'package:dartz/dartz.dart';

import '../../../../core/failure/api_failure.dart';
import '../entities/weapon/weapon_entity.dart';
import '../repositories/weapon_repository.dart';

class FetchAllWeaponsUseCase {
  FetchAllWeaponsUseCase({required this.weaponRepository});

  final WeaponRepository weaponRepository;

  Future<Either<ApiFailure, List<WeaponEntity>>> call() {
    return weaponRepository.fetchAllWeapons();
  }
}
