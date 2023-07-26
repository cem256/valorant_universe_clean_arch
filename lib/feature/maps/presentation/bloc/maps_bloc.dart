import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/entities/map_entity.dart';
import 'package:valorant_universe_remastered/feature/maps/domain/use_cases/fetch_all_maps_use_case.dart';

part 'maps_bloc.freezed.dart';
part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc({required this.fetchAllMapsUseCase}) : super(const MapsState()) {
    on<MapsFetched>(_onMapsFetched);
  }
  final FetchAllMapsUseCase fetchAllMapsUseCase;

  Future<void> _onMapsFetched(MapsFetched event, Emitter<MapsState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));
    final result = await fetchAllMapsUseCase();

    result.fold(
      (failure) => emit(state.copyWith(status: PageStatus.failure, failure: failure)),
      (maps) => emit(state.copyWith(maps: maps, status: PageStatus.success)),
    );
  }
}
