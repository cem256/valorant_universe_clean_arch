part of 'agents_bloc.dart';

@freezed
class AgentsEvent with _$AgentsEvent {
  const factory AgentsEvent.agentsFetched() = AgentsFetched;
  const factory AgentsEvent.agentsSorted(int index) = AgentsSorted;
}
