import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weapons_bloc.freezed.dart';
part 'weapons_event.dart';
part 'weapons_state.dart';

class WeaponsBloc extends Bloc<WeaponsEvent, WeaponsState> {
  WeaponsBloc() : super(const _Initial()) {
    on<WeaponsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
