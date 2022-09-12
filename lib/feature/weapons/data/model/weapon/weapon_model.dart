import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/weapon/weapon_entity.dart';
import '../weapon_stats/weapon_stats_model.dart';

part 'weapon_model.freezed.dart';
part 'weapon_model.g.dart';

@freezed
class WeaponModel with _$WeaponModel {
  @JsonSerializable(explicitToJson: true)
  const factory WeaponModel({
    String? displayName,
    String? category,
    String? displayIcon,
    WeaponStatsModel? weaponStats,
  }) = _WeaponModel;

  factory WeaponModel.fromJson(Map<String, dynamic> json) => _$WeaponModelFromJson(json);
}

extension WeaponModelX on WeaponModel {
  WeaponEntity toWeaponEntity() {
    return WeaponEntity(
      displayName: displayName ?? "N/A",
      category: category ?? "N/A",
      displayIcon: displayIcon ?? "",
      weaponStats: weaponStats?.toWeaponStatsEntity() ?? const WeaponStatsModel().toWeaponStatsEntity(),
    );
  }
}
