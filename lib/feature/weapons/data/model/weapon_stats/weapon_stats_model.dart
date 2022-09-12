import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/damage_ranges/damage_ranges_entity.dart';
import '../../../domain/entities/weapon_stats/weapon_stats_entity.dart';
import '../damage_ranges/damage_ranges_model.dart';

part 'weapon_stats_model.freezed.dart';
part 'weapon_stats_model.g.dart';

@freezed
class WeaponStatsModel with _$WeaponStatsModel {
  @JsonSerializable(explicitToJson: true)
  const factory WeaponStatsModel({
    double? fireRate,
    int? magazineSize,
    double? reloadTimeSeconds,
    List<DamageRangesModel>? damageRanges,
  }) = _WeaponStatsModel;

  factory WeaponStatsModel.fromJson(Map<String, dynamic> json) => _$WeaponStatsModelFromJson(json);
}

extension WeaponStatsModelX on WeaponStatsModel {
  WeaponStatsEntity toWeaponStatsEntity() {
    return WeaponStatsEntity(
      fireRate: fireRate ?? 0,
      magazineSize: magazineSize ?? 0,
      reloadTimeSeconds: reloadTimeSeconds ?? 0,
      damageRanges: getDamageRanges(),
    );
  }

  List<DamageRangesEntity> getDamageRanges() {
    return damageRanges?.map((element) => element.toDamageRangesEntity()).toList() ?? [];
  }
}
