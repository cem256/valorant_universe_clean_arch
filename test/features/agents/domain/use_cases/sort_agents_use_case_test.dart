import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/repositories/agent_repository.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/use_cases/sort_agents_use_case.dart';

class MockAgentRepository extends Mock implements AgentRepository {}

class MockAgentEntity extends Mock implements AgentEntity {}

void main() {
  late MockAgentRepository mockAgentRepository;
  late SortAgentUseCase sortAgentUseCase;
  late List<MockAgentEntity> mockAgentEntity;

  setUp(() {
    mockAgentRepository = MockAgentRepository();
    sortAgentUseCase = SortAgentUseCase(agentRepository: mockAgentRepository);
    mockAgentEntity = List.generate(10, (index) => MockAgentEntity());
  });

  group("Sort agents use case test", () {
    test("should return list of agent enitities length of 10 when index equals to 0", () {
      when(() => mockAgentRepository.sortAgents(allAgents: mockAgentEntity, index: 0)).thenReturn(mockAgentEntity);
      final result = sortAgentUseCase(allAgents: mockAgentEntity, index: 0);

      verify(() => sortAgentUseCase(allAgents: mockAgentEntity, index: 0));
      expect(result.length, 10);
    });
  });
}
