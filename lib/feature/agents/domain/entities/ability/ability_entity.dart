import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_entity.freezed.dart';

@freezed
class AbilityEntity with _$AbilityEntity {
  const factory AbilityEntity({
    required String slot,
    required String displayName,
    required String description,
    required String displayIcon,
  }) = _AbilityEntity;
}
