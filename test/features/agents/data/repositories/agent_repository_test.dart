import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/core/network/network_info.dart';
import 'package:valorant_universe_remastered/feature/agents/data/data_sources/remote/agents_remote_data_source.dart';
import 'package:valorant_universe_remastered/feature/agents/data/model/agent/agent_model.dart';
import 'package:valorant_universe_remastered/feature/agents/data/repositories/agent_repository_imp.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/repositories/agent_repository.dart';

class MockAgentsRemoteDataSource extends Mock implements AgentsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockAgentModel extends Mock implements AgentModel {}

class MockAgentEntity extends Mock implements AgentEntity {}

void main() {
  late MockAgentsRemoteDataSource mockAgentsRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late AgentRepository agentRepository;
  late List<MockAgentModel> mockAgentModel;
  late List<MockAgentEntity> mockAgentEntity;

  setUp(() {
    mockAgentsRemoteDataSource = MockAgentsRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    agentRepository = AgentRepositoryImp(
      agentsRemoteDataSource: mockAgentsRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
    mockAgentModel = List.generate(10, (index) => MockAgentModel());
    mockAgentEntity = List.generate(10, (index) => MockAgentEntity());
  });
  group("Checks the device connection", () {
    test("Device is online", () {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test("Device is offline", () {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
  });

  group("fetch agents", () {
    test("should return list of agent entities when there is no exception", () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockAgentsRemoteDataSource.fetchAgents()).thenAnswer((_) async => mockAgentModel);
      final result = await agentRepository.fetchAllAgents();

      verify(() => mockAgentsRemoteDataSource.fetchAgents());
      expect(result, isA<Right<ApiFailure, List<AgentEntity>>>());
    });
  });

  test("should return ApiFailure when there is an exception", () async {
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockAgentsRemoteDataSource.fetchAgents()).thenThrow(Exception());
    final result = await agentRepository.fetchAllAgents();

    verify(() => mockAgentsRemoteDataSource.fetchAgents());
    expect(result, isA<Left<ApiFailure, List<AgentEntity>>>());
  });

  test("should return list of agent enitities length of 10 when index equals to 0", () {
    final result = agentRepository.sortAgents(allAgents: mockAgentEntity, index: 0);

    expect(result.length, 10);
  });
}
