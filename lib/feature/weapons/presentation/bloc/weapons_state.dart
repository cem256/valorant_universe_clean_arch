part of 'weapons_bloc.dart';

@freezed
class WeaponsState with _$WeaponsState {
  const factory WeaponsState({
    @Default(PageStatus.initial) PageStatus status,
    @Default([]) List<WeaponEntity> weapons,
  }) = _WeaponsState;
}
