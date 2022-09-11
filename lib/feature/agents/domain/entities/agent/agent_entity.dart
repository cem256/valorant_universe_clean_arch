import 'package:freezed_annotation/freezed_annotation.dart';

import '../ability/ability_entity.dart';
import '../role/role_entity.dart';

part 'agent_entity.freezed.dart';

@freezed
class AgentEntity with _$AgentEntity {
  const factory AgentEntity({
    required String displayName,
    required String description,
    required String bustPortrait,
    required String fullPortrait,
    required String fullPortraitV2,
    required List<String> backgroundGradientColors,
    required RoleEntity role,
    required List<AbilityEntity> abilities,
  }) = _AgentEntity;
}
