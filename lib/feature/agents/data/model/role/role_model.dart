import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:valorant_universe_remastered/feature/agents/domain/entities/role/role_entity.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
class RoleModel with _$RoleModel {
  const factory RoleModel({
    String? displayName,
    String? description,
    String? displayIcon,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);
}

extension RoleModelX on RoleModel {
  RoleEntity toRoleEntity() {
    return RoleEntity(
      displayName: displayName ?? 'N/A',
      description: description ?? 'N/A',
      displayIcon: displayIcon ?? '',
    );
  }
}
