import 'package:fpdart/fpdart.dart';

import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/repositories/weapon_repository.dart';

class FetchAllWeaponsUseCase {
  FetchAllWeaponsUseCase({required this.weaponRepository});

  final WeaponRepository weaponRepository;

  Future<Either<Failure, List<WeaponEntity>>> call() {
    return weaponRepository.fetchAllWeapons();
  }
}
