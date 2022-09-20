import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/page_status.dart';
import '../../../../core/failure/api_failure.dart';
import '../../domain/entities/map_entity.dart';
import '../../domain/use_cases/fetch_all_maps_use_case.dart';

part 'maps_bloc.freezed.dart';
part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final FetchAllMapsUseCase fetchAllMapsUseCase;
  MapsBloc({required this.fetchAllMapsUseCase}) : super(const MapsState()) {
    on<MapsFetched>(_onMapsFetched);
  }

  Future<void> _onMapsFetched(MapsFetched event, Emitter<MapsState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));
    final result = await fetchAllMapsUseCase();

    result.fold(
      (failure) => emit(state.copyWith(status: PageStatus.failure, failure: failure)),
      (maps) => emit(state.copyWith(maps: maps, status: PageStatus.success)),
    );
  }
}
