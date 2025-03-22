import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_request.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_response.dart';
import 'package:tozauz_agent/features/reports/domain/repository/reports_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../data/model/agent_application_list.dart';

part 'reports_state.dart';

part 'reports_cubit.freezed.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(this._repository) : super(const ReportsState());
  final ReportsRepository _repository;
  final ScrollController scrollController = ScrollController();
  int page = 1;
  int pageSize = 10;

  void initial() {
    page = 1;
    pageSize = 10;
  }

  void onScroll() {
    scrollController.addListener(
      () {
        print('Scroll;${scrollController.positions}');
        print('Max;${scrollController.position.maxScrollExtent}');
        print('Pixels;${scrollController.position.pixels}');

        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 20) {
          if (state.applicationList?.count !=
              state.applicationList?.results?.length) {
            fetchMoreAgentApplicationList();
          }
        }
      },
    );
  }

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

  Future<void> fetchAgentApplicationList() async {
    emit(state.copyWith(agentApplicationSt: Status.LOADING));
    final response = await _repository.fetchAgentApplicationList(
        applicationRequest:
            AgentApplicationListRequest(page: page, pageSize: pageSize));

    response.fold(
      (failure) {
        emit(state.copyWith(
            agentApplicationSt: Status.ERROR,
            agentApplicationFailure: failure));
      },
      (response) {
        emit(state.copyWith(
            agentApplicationSt: Status.SUCCESS, applicationList: response));
      },
    );
  }

  Future<void> fetchMoreAgentApplicationList() async {
    page = page + 1;
    emit(state.copyWith(agentApplicationSt: Status.OTHER_LOADING));
    final response = await _repository.fetchAgentApplicationList(
        applicationRequest:
            AgentApplicationListRequest(page: page, pageSize: pageSize));

    response.fold(
      (failure) {
        emit(state.copyWith(
            agentApplicationSt: Status.ERROR,
            agentApplicationFailure: failure));
      },
      (response) {
        final newList = response.results ?? [];
        final oldList = state.applicationList?.results ?? [];
        oldList.addAll(newList);
        emit(
          state.copyWith(
            agentApplicationSt: Status.SUCCESS,
            applicationList: AgentApplicationList(results: oldList),
          ),
        );
      },
    );
  }
}
