part of 'container_cubit.dart';

class ContainerState {
  final Failure boxListFailure, earningListFailure;
  final Status boxListStatus, earningListStatus;
  final List<BoxResponseModel> boxList;
  final List<EarningResponseModel> earningList;

  ContainerState({
    this.boxListFailure = const UnknownFailure(),
    this.earningListFailure = const UnknownFailure(),
    this.boxListStatus = Status.UNKNOWN,
    this.earningListStatus = Status.UNKNOWN,
    this.boxList = const [],
    this.earningList = const [],
  });

  ContainerState copyWith({
    Failure? boxListFailure,
    Failure? earningListFailure,
    Status? boxListStatus,
    Status? earningListStatus,
    List<BoxResponseModel>? boxList,
    List<EarningResponseModel>? earningList,
  }) {
    return ContainerState(
      boxListFailure: boxListFailure ?? this.boxListFailure,
      earningListFailure: earningListFailure ?? this.earningListFailure,
      boxListStatus: boxListStatus ?? this.boxListStatus,
      earningListStatus: earningListStatus ?? this.earningListStatus,
      boxList: boxList ?? this.boxList,
      earningList: earningList ?? this.earningList,
    );
  }
}
