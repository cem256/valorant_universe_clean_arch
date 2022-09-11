import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/agent/agent_entity.dart';
import '../../domain/repositories/agent_repository.dart';

part 'agents_bloc.freezed.dart';
part 'agents_event.dart';
part 'agents_state.dart';

class AgentsBloc extends Bloc<AgentsEvent, AgentsState> {
  final AgentRepository agentRepository;
  AgentsBloc({required this.agentRepository}) : super(const AgentsState.initial()) {
    on<AgentsFetched>(_onAgentsFetched);
  }

  Future<void> _onAgentsFetched(AgentsFetched event, Emitter<AgentsState> emit) async {
    emit(const AgentsState.loading());
    final result = await agentRepository.fetchAllAgents();

    result.fold(
      (failure) => emit(const AgentsState.failure()),
      (agents) => emit(AgentsState.succes(agents: agents)),
    );
  }
}
