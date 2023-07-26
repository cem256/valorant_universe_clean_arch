part of 'maps_bloc.dart';

@freezed
class MapsState with _$MapsState {
  const factory MapsState({
    @Default(PageStatus.initial) PageStatus status,
    @Default([]) List<MapEntity> maps,
    Failure? failure,
  }) = _MapsState;
}
