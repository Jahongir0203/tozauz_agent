import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/agent_application_response.dart';

abstract class ReportsRepository{
  Future<Either<Failure, AgentApplicationResponse>> createAgentApplication(
      {required AgentApplicationResponse agentApplication});
}