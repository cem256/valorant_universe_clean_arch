import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_entity.freezed.dart';

@freezed
class MapEntity with _$MapEntity {
  const factory MapEntity({
    required String displayName,
    required String coordinates,
    required String displayIcon,
    required String listViewIcon,
    required String splash,
  }) = _MapEntity;
}
