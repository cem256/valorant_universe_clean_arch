import 'package:dartz/dartz.dart';

import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/repositories/agent_repository.dart';

class FetchAllAgentsUseCase {
  FetchAllAgentsUseCase({required this.agentRepository});

  final AgentRepository agentRepository;

  Future<Either<ApiFailure, List<AgentEntity>>> call() {
    return agentRepository.fetchAllAgents();
  }
}
