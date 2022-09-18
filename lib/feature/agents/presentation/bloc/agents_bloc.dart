import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/page_status.dart';
import '../../../../core/failure/api_failure.dart';
import '../../domain/entities/agent/agent_entity.dart';
import '../../domain/use_cases/fetch_all_agents_use_case.dart';
import '../../domain/use_cases/sort_agents_use_case.dart';

part 'agents_bloc.freezed.dart';
part 'agents_event.dart';
part 'agents_state.dart';

class AgentsBloc extends Bloc<AgentsEvent, AgentsState> {
  final FetchAllAgentsUseCase fetchAllAgentsUseCase;
  final SortAgentUseCase sortAgentUseCase;
  AgentsBloc({required this.fetchAllAgentsUseCase, required this.sortAgentUseCase}) : super(const AgentsState()) {
    on<AgentsFetched>(_onAgentsFetched);
    on<AgentsSorted>(_onAgentsSorted);
  }

  Future<void> _onAgentsFetched(AgentsFetched event, Emitter<AgentsState> emit) async {
    emit(state.copyWith(status: PageStatus.loading));
    final result = await fetchAllAgentsUseCase();

    result.fold(
      (failure) => emit(state.copyWith(status: PageStatus.failure, failure: failure)),
      (agents) => emit(state.copyWith(agents: agents, allAgents: agents, status: PageStatus.success)),
    );
  }

  void _onAgentsSorted(AgentsSorted event, Emitter<AgentsState> emit) {
    final List<AgentEntity> agents = sortAgentUseCase.call(allAgents: state.allAgents, index: event.index);

    emit(state.copyWith(agents: agents, selectedIndex: event.index));
  }
}
