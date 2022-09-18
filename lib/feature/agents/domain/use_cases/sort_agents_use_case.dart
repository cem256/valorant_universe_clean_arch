import '../entities/agent/agent_entity.dart';
import '../repositories/agent_repository.dart';

class SortAgentUseCase {
  SortAgentUseCase({required this.agentRepository});

  final AgentRepository agentRepository;

  List<AgentEntity> call({required List<AgentEntity> allAgents, required int index}) {
    return agentRepository.sortAgents(allAgents: allAgents, index: index);
  }
}
