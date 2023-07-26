import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.dioFailure(String? error) = _DioFailure;
  const factory Failure.unknownFailure() = _UnknownFailure;
  const factory Failure.nullResponseFailure() = _NullResposeFailure;
  const factory Failure.noConnectionFailure() = _NoConnectionFailure;
}
