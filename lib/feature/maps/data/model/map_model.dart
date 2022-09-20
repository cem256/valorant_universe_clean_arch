import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/map_entity.dart';

part 'map_model.freezed.dart';
part 'map_model.g.dart';

@freezed
class MapModel with _$MapModel {
  const factory MapModel({
    String? displayName,
    String? coordinates,
    String? displayIcon,
    String? listViewIcon,
    String? splash,
  }) = _MapModel;

  factory MapModel.fromJson(Map<String, dynamic> json) => _$MapModelFromJson(json);
}

extension MapModelX on MapModel {
  MapEntity toMapEntity() {
    return MapEntity(
      displayName: displayName ?? "N/A",
      coordinates: coordinates ?? "N/A",
      displayIcon: displayIcon ?? "",
      listViewIcon: listViewIcon ?? "",
      splash: splash ?? "",
    );
  }
}
