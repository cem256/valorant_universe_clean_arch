import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_universe_remastered/core/extensions/string_extension.dart';
import 'package:valorant_universe_remastered/feature/agents/data/model/ability/ability_model.dart';
import 'package:valorant_universe_remastered/feature/agents/data/model/role/role_model.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/ability/ability_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';

part 'agent_model.freezed.dart';
part 'agent_model.g.dart';

@freezed
class AgentModel with _$AgentModel {
  const factory AgentModel({
    String? displayName,
    String? description,
    String? bustPortrait,
    String? fullPortrait,
    String? fullPortraitV2,
    List<String>? backgroundGradientColors,
    RoleModel? role,
    List<AbilityModel>? abilities,
  }) = _AgentModel;
  @JsonSerializable(explicitToJson: true)
  const AgentModel._();

  factory AgentModel.fromJson(Map<String, dynamic> json) => _$AgentModelFromJson(json);
}

extension AgentModelX on AgentModel {
  AgentEntity toAgentEntity() {
    return AgentEntity(
      displayName: displayName ?? 'N/A',
      description: description ?? 'N/A',
      bustPortrait: bustPortrait ?? '',
      fullPortrait: fullPortrait ?? '',
      fullPortraitV2: fullPortraitV2 ?? '',
      backgroundGradientColors: getGradientColors(),
      role: role?.toRoleEntity() ?? const RoleModel().toRoleEntity(),
      abilities: getAbilities(),
    );
  }

  List<Color> getGradientColors() {
    final gradientColors = <Color>[];
    backgroundGradientColors?.forEach((element) {
      gradientColors.add(element.toColor());
    });
    return gradientColors;
  }

  List<AbilityEntity> getAbilities() {
    return abilities?.map((element) => element.toAbilityEntity()).toList() ?? [];
  }
}
