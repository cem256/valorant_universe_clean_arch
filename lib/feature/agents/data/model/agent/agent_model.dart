import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/extensions/string_extension.dart';
import '../../../domain/entities/ability/ability_entity.dart';
import '../../../domain/entities/agent/agent_entity.dart';
import '../ability/ability_model.dart';
import '../role/role_model.dart';

part 'agent_model.freezed.dart';
part 'agent_model.g.dart';

@freezed
class AgentModel with _$AgentModel {
  @JsonSerializable(explicitToJson: true)
  const AgentModel._();

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

  factory AgentModel.fromJson(Map<String, dynamic> json) => _$AgentModelFromJson(json);
}

extension AgentModelX on AgentModel {
  AgentEntity toAgentEntity() {
    return AgentEntity(
      displayName: displayName ?? "N/A",
      description: description ?? "N/A",
      bustPortrait: bustPortrait ?? "",
      fullPortrait: fullPortrait ?? "",
      fullPortraitV2: fullPortraitV2 ?? "",
      backgroundGradientColors: getGradientColors(),
      role: role?.toRoleEntity() ?? const RoleModel().toRoleEntity(),
      abilities: getAbilities(),
    );
  }

  List<Color> getGradientColors() {
    List<Color> gradientColors = [];
    backgroundGradientColors?.forEach((element) {
      gradientColors.add(element.toColor());
    });
    return gradientColors;
  }

  List<AbilityEntity> getAbilities() {
    return abilities?.map((element) => element.toAbilityEntity()).toList() ?? [];
  }
}
