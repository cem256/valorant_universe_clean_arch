import 'package:freezed_annotation/freezed_annotation.dart';

import '../damage_ranges/damage_ranges_entity.dart';

part 'weapon_stats_entity.freezed.dart';

@freezed
class WeaponStatsEntity with _$WeaponStatsEntity {
  const factory WeaponStatsEntity({
    required double fireRate,
    required int magazineSize,
    required double reloadTimeSeconds,
    required List<DamageRangesEntity> damageRanges,
  }) = _WeaponStatsEntity;
}
