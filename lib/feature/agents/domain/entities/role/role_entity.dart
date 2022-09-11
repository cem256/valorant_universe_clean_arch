import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_entity.freezed.dart';

@freezed
class RoleEntity with _$RoleEntity {
  const factory RoleEntity({
    required String displayName,
    required String description,
    required String displayIcon,
  }) = _RoleEntity;
}
