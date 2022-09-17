import 'package:dartz/dartz.dart';

import '../../../../core/failure/api_failure.dart';
import '../entities/agent/agent_entity.dart';
import '../repositories/agent_repository.dart';

class FetchAllAgentsUseCase {
  FetchAllAgentsUseCase({required this.agentRepository});

  final AgentRepository agentRepository;

  Future<Either<ApiFailure, List<AgentEntity>>> call() {
    return agentRepository.fetchAllAgents();
  }
}
