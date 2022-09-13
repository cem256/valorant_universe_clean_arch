import 'package:freezed_annotation/freezed_annotation.dart';

part 'damage_ranges_entity.freezed.dart';

@freezed
class DamageRangesEntity with _$DamageRangesEntity {
  const factory DamageRangesEntity({
    required String rangeStartMeters,
    required String rangeEndMeters,
    required String headDamage,
    required String bodyDamage,
    required String legDamage,
  }) = _DamageRangesEntity;
}
