part of 'reports_cubit.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState({
    final Status? status,
    @Default(UnknownFailure()) Failure failure,
  }) = _ReportsState;
}
