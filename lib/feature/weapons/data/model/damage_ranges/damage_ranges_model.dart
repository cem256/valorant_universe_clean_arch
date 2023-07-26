import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:valorant_universe_remastered/feature/weapons/domain/entities/damage_ranges/damage_ranges_entity.dart';

part 'damage_ranges_model.freezed.dart';
part 'damage_ranges_model.g.dart';

@freezed
class DamageRangesModel with _$DamageRangesModel {
  const factory DamageRangesModel({
    double? rangeStartMeters,
    double? rangeEndMeters,
    double? headDamage,
    double? bodyDamage,
    double? legDamage,
  }) = _DamageRangesModel;

  factory DamageRangesModel.fromJson(Map<String, dynamic> json) => _$DamageRangesModelFromJson(json);
}

extension DamageRangesModelX on DamageRangesModel {
  DamageRangesEntity toDamageRangesEntity() {
    return DamageRangesEntity(
      rangeStartMeters: rangeStartMeters?.toStringAsFixed(0) ?? 'N/A',
      rangeEndMeters: rangeEndMeters?.toStringAsFixed(0) ?? 'N/A',
      headDamage: headDamage?.toStringAsFixed(1) ?? 'N/A',
      bodyDamage: bodyDamage?.toStringAsFixed(1) ?? 'N/A',
      legDamage: legDamage?.toStringAsFixed(1) ?? 'N/A',
    );
  }
}
