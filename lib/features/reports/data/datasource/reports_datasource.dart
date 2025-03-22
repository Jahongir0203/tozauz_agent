import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tozauz_agent/core/api/api.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_list.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_response.dart';

import '../../../../core/error/failure.dart';
import '../../../../export.dart';
import '../model/agent_application_request.dart';

abstract class ReportsDataSource {
  Future<Either<Failure, AgentApplicationResponse>> createAgentApplication(
      {required AgentApplicationResponse agentApplication});

  Future<Either<Failure, AgentApplicationList>> fetchAgentApplicationList(
      {required AgentApplicationListRequest applicationRequest});
}

class ReportsDataSourceImpl extends ReportsDataSource {
  final DioClient _dioClient;

  ReportsDataSourceImpl(this._dioClient);

  @override
  Future<Either<Failure, AgentApplicationResponse>> createAgentApplication(
      {required AgentApplicationResponse agentApplication}) async {
    try {
      Response response = await _dioClient.post(ListAPI.agentAppCreate,
          data: {
            'box': agentApplication.box,
            if (agentApplication.comment != null)
              'comment': agentApplication.comment,
            'containers_count': agentApplication.containersCount,
            'payment_type': agentApplication.paymentType
          },
          options: Options(headers: {
            "Authorization": "Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
          }));
      if (response.statusCode == 201) {
        return Right(AgentApplicationResponse.fromJson(response.data));
      } else {
        return Left(ServerFailure(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return Left(ConnectionFailure());
      }
      if (e.response?.statusCode == 500 || e.response?.statusCode == 502) {
        return Left(ServerFailure(e.response?.statusCode));
      }
      if (e.response?.statusCode == 400) {
        final errorMessage = e.response?.data['message'] ?? 'Unknown error';
        return Left(GeneralFailure(errorMessage));
      } else {
        return Left(ServerFailure(e.response?.statusCode));
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
      rethrow;
    }
  }

  @override
  Future<Either<Failure, AgentApplicationList>> fetchAgentApplicationList(
      {required AgentApplicationListRequest applicationRequest}) async {
    try {
      Response response = await _dioClient.get(
        ListAPI.agentApplicationList,
        queryParameters: {
          // "status": applicationRequest.status,
          // "employee": applicationRequest.employee,
          // "box": applicationRequest.box,
          // "payment_type": applicationRequest.paymentType,
          "page":applicationRequest.page,
          "page_size":applicationRequest.pageSize
        },
        options: Options(
          headers: {
            "Authorization": "Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
          },
        ),
      );
      if (response.statusCode == 200) {
        return Right(AgentApplicationList.fromJson(response.data));
      } else {
        return Left(ServerFailure(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return Left(ConnectionFailure());
      }
      if (e.response?.statusCode == 500 || e.response?.statusCode == 502) {
        return Left(ServerFailure(e.response?.statusCode));
      }
      if (e.response?.statusCode == 400) {
        final errorMessage = e.response?.data['message'] ?? 'Unknown error';
        return Left(GeneralFailure(errorMessage));
      } else {
        return Left(ServerFailure(e.response?.statusCode));
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
      rethrow;
    }
  }
}
