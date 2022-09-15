import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/enums/page_status.dart';
import '../../../../core/failure/api_failure.dart';
import '../../domain/entities/agent/agent_entity.dart';
import '../../domain/repositories/agent_repository.dart';

part 'agents_bloc.freezed.dart';
part 'agents_event.dart';
part 'agents_state.dart';

class AgentsBloc extends Bloc<AgentsEvent, AgentsState> {
  final AgentRepository agentRepository;
  AgentsBloc({required this.agentRepository}) : super(const AgentsState()) {
    on<AgentsFetched>(_onAgentsFetched);
    on<AgentsSorted>(_onAgentsSorted);
  }

  Future<void> _onAgentsFetched(AgentsFetched event, Emitter<AgentsState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));
    final result = await agentRepository.fetchAllAgents();

    result.fold(
      (failure) => emit(state.copyWith(status: PageStatus.failure, failure: failure)),
      (agents) => emit(state.copyWith(agents: agents, allAgents: agents, status: PageStatus.success)),
    );
  }

  void _onAgentsSorted(AgentsSorted event, Emitter<AgentsState> emit) {
    if (event.index == 0) {
      emit(state.copyWith(agents: state.allAgents, selectedIndex: event.index));
    } else {
      final agents = state.allAgents.where((element) {
        return element.role.displayName == Strings.roles[event.index];
      }).toList();
      emit(state.copyWith(agents: agents, selectedIndex: event.index));
    }
  }
}
