import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/features/reports/data/datasource/reports_datasource.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_list.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_request.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_response.dart';
import 'package:tozauz_agent/features/reports/domain/repository/reports_repository.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsDataSource _reportsDataSource;

  ReportsRepositoryImpl(this._reportsDataSource);

  @override
  Future<Either<Failure, AgentApplicationResponse>> createAgentApplication(
      {required AgentApplicationResponse agentApplication}) async {
    final response = await _reportsDataSource.createAgentApplication(
        agentApplication: agentApplication);

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failure, AgentApplicationList>> fetchAgentApplicationList(
      {required AgentApplicationListRequest applicationRequest}) async {
    final response = await _reportsDataSource.fetchAgentApplicationList(
        applicationRequest: applicationRequest);

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (response) {
        return Right(response);
      },
    );
  }
}
