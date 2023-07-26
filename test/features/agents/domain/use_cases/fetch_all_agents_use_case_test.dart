import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/repositories/agent_repository.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/use_cases/fetch_all_agents_use_case.dart';

class MockAgentRepository extends Mock implements AgentRepository {}

class MockAgentEntity extends Mock implements AgentEntity {}

void main() {
  late MockAgentRepository mockAgentRepository;
  late FetchAllAgentsUseCase fetchAllAgentsUseCase;
  late List<MockAgentEntity> mockAgentEntity;

  setUp(() {
    mockAgentRepository = MockAgentRepository();
    fetchAllAgentsUseCase = FetchAllAgentsUseCase(agentRepository: mockAgentRepository);
    mockAgentEntity = List.generate(10, (index) => MockAgentEntity());
  });

  group('Fetch All Agents Use Case Test', () {
    test('Should return list of agent entities when there is no exception', () async {
      when(() => mockAgentRepository.fetchAllAgents()).thenAnswer((_) async => Right(mockAgentEntity));
      final result = await fetchAllAgentsUseCase();

      verify(() => fetchAllAgentsUseCase());
      expect(result, isA<Right<ApiFailure, List<AgentEntity>>>());
    });

    test('Should return ApiFailure when there is an exception', () async {
      when(() => mockAgentRepository.fetchAllAgents()).thenAnswer((_) async => const Left(ApiFailure.unknownFailure()));
      final result = await fetchAllAgentsUseCase();

      verify(() => fetchAllAgentsUseCase());
      expect(result, isA<Left<ApiFailure, List<AgentEntity>>>());
    });
  });
}
