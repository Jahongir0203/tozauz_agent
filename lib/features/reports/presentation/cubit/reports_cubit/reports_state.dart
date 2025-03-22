part of 'reports_cubit.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState({
    @Default(Status.UNKNOWN) Status status,
    @Default(Status.UNKNOWN) Status agentApplicationSt,
    @Default(UnknownFailure()) Failure failure,
    @Default(UnknownFailure()) Failure agentApplicationFailure,
    @Default(null) AgentApplicationList? applicationList,
  }) = _ReportsState;
}
