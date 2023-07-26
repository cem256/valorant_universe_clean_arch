import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_universe_remastered/feature/weapons/data/model/damage_ranges/damage_ranges_model.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/damage_ranges/damage_ranges_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon_stats/weapon_stats_entity.dart';

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
      fireRate: fireRate?.toStringAsFixed(2) ?? 'N/A',
      magazineSize: magazineSize.toString(),
      reloadTimeSeconds: reloadTimeSeconds?.toStringAsFixed(2) ?? 'N/A',
      damageRanges: getDamageRanges(),
    );
  }

  List<DamageRangesEntity> getDamageRanges() {
    return damageRanges?.map((element) => element.toDamageRangesEntity()).toList() ?? [];
  }
}
