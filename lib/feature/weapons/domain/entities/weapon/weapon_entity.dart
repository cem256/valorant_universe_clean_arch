import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon_stats/weapon_stats_entity.dart';

part 'weapon_entity.freezed.dart';

@freezed
class WeaponEntity with _$WeaponEntity {
  const factory WeaponEntity({
    required String displayName,
    required String category,
    required String displayIcon,
    required WeaponStatsEntity weaponStats,
  }) = _WeaponEntity;
}
