import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/use_cases/fetch_all_agents_use_case.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/use_cases/sort_agents_use_case.dart';

part 'agents_bloc.freezed.dart';
part 'agents_event.dart';
part 'agents_state.dart';

class AgentsBloc extends Bloc<AgentsEvent, AgentsState> {
  AgentsBloc({required this.fetchAllAgentsUseCase, required this.sortAgentUseCase}) : super(const AgentsState()) {
    on<AgentsFetched>(_onAgentsFetched);
    on<AgentsSorted>(_onAgentsSorted);
  }
  final FetchAllAgentsUseCase fetchAllAgentsUseCase;
  final SortAgentUseCase sortAgentUseCase;

  Future<void> _onAgentsFetched(AgentsFetched event, Emitter<AgentsState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));
    final result = await fetchAllAgentsUseCase();

    result.fold(
      (failure) => emit(state.copyWith(status: PageStatus.failure, failure: failure)),
      (agents) => emit(state.copyWith(agents: agents, allAgents: agents, status: PageStatus.success)),
    );
  }

  void _onAgentsSorted(AgentsSorted event, Emitter<AgentsState> emit) {
    final agents = sortAgentUseCase(allAgents: state.allAgents, index: event.index);

    emit(state.copyWith(agents: agents, selectedIndex: event.index));
  }
}
