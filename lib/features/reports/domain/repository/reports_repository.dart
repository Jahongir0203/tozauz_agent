import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/agent_application_list.dart';
import '../../data/model/agent_application_request.dart';
import '../../data/model/agent_application_response.dart';

abstract class ReportsRepository{
  Future<Either<Failure, AgentApplicationResponse>> createAgentApplication(
      {required AgentApplicationResponse agentApplication});

  Future<Either<Failure, AgentApplicationList>> fetchAgentApplicationList(
      {required AgentApplicationListRequest applicationRequest});
}