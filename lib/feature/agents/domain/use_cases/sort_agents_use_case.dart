import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/repositories/agent_repository.dart';

class SortAgentUseCase {
  SortAgentUseCase({required this.agentRepository});

  final AgentRepository agentRepository;

  List<AgentEntity> call({required List<AgentEntity> allAgents, required int index}) {
    return agentRepository.sortAgents(allAgents: allAgents, index: index);
  }
}
