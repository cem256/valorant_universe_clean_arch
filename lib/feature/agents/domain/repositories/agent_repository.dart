import 'package:dartz/dartz.dart';

import 'package:valorant_universe_remastered/app/errors/failure/failure.dart';
import 'package:valorant_universe_remastered/feature/agents/domain/entities/agent/agent_entity.dart';

abstract class AgentRepository {
  Future<Either<Failure, List<AgentEntity>>> fetchAllAgents();
  List<AgentEntity> sortAgents({required List<AgentEntity> allAgents, required int index});
}
