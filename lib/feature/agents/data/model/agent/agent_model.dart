import 'package:freezed_annotation/freezed_annotation.dart';

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
      bustPortrait: bustPortrait ?? "N/A",
      fullPortrait: fullPortrait ?? "N/A",
      fullPortraitV2: fullPortraitV2 ?? "N/A",
      backgroundGradientColors: backgroundGradientColors ?? [],
      role: role?.toRoleEntity() ?? const RoleModel().toRoleEntity(),
      abilities: getAbilities(),
    );
  }

  List<AbilityEntity> getAbilities() {
    return abilities?.map((element) => element.toAbilityEntity()).toList() ?? [];
  }
}
