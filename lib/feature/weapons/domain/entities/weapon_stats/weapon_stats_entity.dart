import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:valorant_universe_remastered/feature/weapons/domain/entities/damage_ranges/damage_ranges_entity.dart';

part 'weapon_stats_entity.freezed.dart';

@freezed
class WeaponStatsEntity with _$WeaponStatsEntity {
  const factory WeaponStatsEntity({
    required String fireRate,
    required String magazineSize,
    required String reloadTimeSeconds,
    required List<DamageRangesEntity> damageRanges,
  }) = _WeaponStatsEntity;
}
