part of 'weapons_bloc.dart';

@freezed
class WeaponsEvent with _$WeaponsEvent {
  const factory WeaponsEvent.weaponsFetched() = WeaponsFetched;
}
