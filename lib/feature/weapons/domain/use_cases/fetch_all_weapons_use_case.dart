import 'package:dartz/dartz.dart';

import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/repositories/weapon_repository.dart';

class FetchAllWeaponsUseCase {
  FetchAllWeaponsUseCase({required this.weaponRepository});

  final WeaponRepository weaponRepository;

  Future<Either<ApiFailure, List<WeaponEntity>>> call() {
    return weaponRepository.fetchAllWeapons();
  }
}
