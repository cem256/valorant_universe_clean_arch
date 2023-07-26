import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/entities/weapon/weapon_entity.dart';
import 'package:valorant_universe_remastered/feature/weapons/domain/use_cases/fetch_all_weapons_use_case.dart';

part 'weapons_bloc.freezed.dart';
part 'weapons_event.dart';
part 'weapons_state.dart';

class WeaponsBloc extends Bloc<WeaponsEvent, WeaponsState> {
  WeaponsBloc({required this.fetchAllWeaponsUseCase}) : super(const WeaponsState()) {
    on<WeaponsFetched>(_onWeaponsFetched);
  }
  final FetchAllWeaponsUseCase fetchAllWeaponsUseCase;

  Future<void> _onWeaponsFetched(WeaponsFetched event, Emitter<WeaponsState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));
    final result = await fetchAllWeaponsUseCase();

    result.fold(
      (failure) => emit(state.copyWith(status: PageStatus.failure, failure: failure)),
      (weapons) => emit(state.copyWith(weapons: weapons, status: PageStatus.success)),
    );
  }
}
