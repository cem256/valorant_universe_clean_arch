part of 'agents_bloc.dart';

@freezed
class AgentsState with _$AgentsState {
  const factory AgentsState({
    @Default(PageStatus.initial) PageStatus status,
    @Default([]) List<AgentEntity> agents,
    @Default([]) List<AgentEntity> allAgents,
    @Default(0) int selectedIndex,
    Failure? failure,
  }) = _AgentsState;
}
