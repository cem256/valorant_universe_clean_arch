import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/use_cases/fetch_all_agents_use_case.dart';
import 'package:valorant_universe_remastered/feature/agents/presentation/bloc/agents_bloc.dart';

class MockFetchAllAgentsUseCase extends Mock implements FetchAllAgentsUseCase {}

class MockAgentEntity extends Mock implements AgentEntity {}

void main() {
  late AgentsBloc agentsBloc;
  late MockFetchAllAgentsUseCase mockFetchAllAgentsUseCase;
  late List<MockAgentEntity> mockAgentEntities;

  setUp(() {
    mockFetchAllAgentsUseCase = MockFetchAllAgentsUseCase();
    agentsBloc = AgentsBloc(fetchAllAgentsUseCase: mockFetchAllAgentsUseCase);
    mockAgentEntities = List.generate(10, (index) => MockAgentEntity());
  });

  group("Agents Bloc Tests", () {
    test("Initial value of the 'status' variable must be 'PageStatus.initial' at start", () {
      expect(agentsBloc.state.status, PageStatus.initial);
    });

    test("Default value of the 'status' variable must be 'PageStatus.initial' at start", () {
      expect(agentsBloc.state.status, PageStatus.initial);
    });
    test("Default value of the 'agents' variable must be '[]' at start", () {
      expect(agentsBloc.state.agents, []);
    });

    test("Default value of the 'allAgents' variable must be '[]' at start", () {
      expect(agentsBloc.state.allAgents, []);
    });

    test("Default value of the 'selectedIndex' variable must be '0' at start", () {
      expect(agentsBloc.state.selectedIndex, 0);
    });

    blocTest(
      "Fetch all agents error case test",
      setUp: () {
        when(() => mockFetchAllAgentsUseCase()).thenAnswer(
          (_) async => const Left(ApiFailure.unknownFailure()),
        );
      },
      build: () => agentsBloc,
      act: (bloc) => bloc.add(const AgentsFetched()),
      expect: () => [
        const AgentsState(status: PageStatus.loading),
        const AgentsState(
          status: PageStatus.failure,
          failure: ApiFailure.unknownFailure(),
        ),
      ],
    );

    blocTest(
      "Fetch all agents success case test",
      setUp: () {
        when(() => mockFetchAllAgentsUseCase()).thenAnswer(
          (_) async => Right(mockAgentEntities),
        );
      },
      build: () => agentsBloc,
      act: (bloc) => bloc.add(const AgentsFetched()),
      expect: () => [
        const AgentsState(status: PageStatus.loading),
        AgentsState(
          agents: mockAgentEntities,
          allAgents: mockAgentEntities,
          status: PageStatus.success,
        ),
      ],
    );
  });
}
