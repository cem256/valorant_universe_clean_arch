import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/damage_ranges/damage_ranges_entity.dart';

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
      rangeStartMeters: rangeStartMeters ?? 0,
      rangeEndMeters: rangeEndMeters ?? 0,
      headDamage: headDamage ?? 0,
      bodyDamage: bodyDamage ?? 0,
      legDamage: legDamage ?? 0,
    );
  }
}
