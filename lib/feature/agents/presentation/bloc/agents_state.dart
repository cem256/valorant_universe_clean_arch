part of 'agents_bloc.dart';

@freezed
class AgentsState with _$AgentsState {
  const factory AgentsState.initial() = _Initial;
  const factory AgentsState.loading() = _Loading;
  const factory AgentsState.succes({required List<AgentEntity> agents}) = _Success;
  const factory AgentsState.failure() = _Failure;
}
