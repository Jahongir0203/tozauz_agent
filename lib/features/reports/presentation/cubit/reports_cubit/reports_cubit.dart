import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_response.dart';
import 'package:tozauz_agent/features/reports/domain/repository/reports_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/values/app_strings.dart';

part 'reports_state.dart';

part 'reports_cubit.freezed.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(this._repository) : super(const ReportsState());
  final ReportsRepository _repository;

  Future<void> createAgentApplication(
      {String? comment,
      required int containerCount,
      required String paymentType}) async {
    emit(state.copyWith(status: Status.LOADING));

    final response = await _repository.createAgentApplication(
        agentApplication: AgentApplicationResponse(
            box: 29,
            comment: comment,
            containersCount: containerCount,
            paymentType: paymentType));

    response.fold(
      (failure) {
        emit(state.copyWith(status: Status.ERROR, failure: failure));
      },
      (response) {
        emit(state.copyWith(status: Status.SUCCESS));
      },
    );
  }
}
