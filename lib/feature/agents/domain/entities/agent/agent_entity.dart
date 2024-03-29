import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:valorant_universe_remastered/feature/agents/domain/entities/ability/ability_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/role/role_entity.dart';

part 'agent_entity.freezed.dart';

@freezed
class AgentEntity with _$AgentEntity {
  const factory AgentEntity({
    required String displayName,
    required String description,
    required String bustPortrait,
    required String fullPortrait,
    required String fullPortraitV2,
    required List<Color> backgroundGradientColors,
    required RoleEntity role,
    required List<AbilityEntity> abilities,
  }) = _AgentEntity;
}
