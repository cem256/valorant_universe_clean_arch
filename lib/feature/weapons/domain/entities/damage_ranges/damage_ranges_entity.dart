import 'package:freezed_annotation/freezed_annotation.dart';

part 'damage_ranges_entity.freezed.dart';

@freezed
class DamageRangesEntity with _$DamageRangesEntity {
  const factory DamageRangesEntity({
    required double rangeStartMeters,
    required double rangeEndMeters,
    required double headDamage,
    required double bodyDamage,
    required double legDamage,
  }) = _DamageRangesEntity;
}
