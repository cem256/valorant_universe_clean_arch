import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_universe_remastered/core/enums/page_status.dart';
import 'package:valorant_universe_remastered/core/failure/api_failure.dart';
import 'package:valorant_universe_remastered/feature/agents/data/repositories/agent_repository_imp.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/ability/ability_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/role/role_entity.dart';
import 'package:valorant_universe_remastered/feature/agents/presentation/bloc/agents_bloc.dart';

class MockAgentRepositoryImp extends Mock implements AgentRepositoryImp {}

void main() {
  late AgentsBloc agentsBloc;
  late MockAgentRepositoryImp mockAgentRepository;
  late List<AgentEntity> tAgentEntities;

  setUp(() {
    mockAgentRepository = MockAgentRepositoryImp();
    agentsBloc = AgentsBloc(agentRepository: mockAgentRepository);

    tAgentEntities = [
      const AgentEntity(
        displayName: "Test DisplayName",
        description: "Test Description",
        bustPortrait: "Test BustPortrait",
        fullPortrait: "Test FullPortrait",
        fullPortraitV2: "Test FullPortraitV2",
        backgroundGradientColors: [],
        role: RoleEntity(
          description: "Test Description",
          displayIcon: "Test DisplayIcon",
          displayName: "Test Dipslay Name",
        ),
        abilities: [
          AbilityEntity(
            description: "Test Description",
            displayIcon: "Test DisplayIcon",
            displayName: "Test DisplayName",
          )
        ],
      ),
    ];
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
        when(() => mockAgentRepository.fetchAllAgents()).thenAnswer(
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
        when(() => mockAgentRepository.fetchAllAgents()).thenAnswer(
          (_) async => Right(tAgentEntities),
        );
      },
      build: () => agentsBloc,
      act: (bloc) => bloc.add(const AgentsFetched()),
      expect: () => [
        const AgentsState(status: PageStatus.loading),
        AgentsState(
          agents: tAgentEntities,
          allAgents: tAgentEntities,
          status: PageStatus.success,
        ),
      ],
    );
  });
}
