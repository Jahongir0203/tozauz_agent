import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/features/home/data/datasource/container_data_source.dart';
import 'package:tozauz_agent/features/home/data/models/agent_earning_response_model.dart';
import 'package:tozauz_agent/features/home/data/models/box_response_model.dart';
import 'package:tozauz_agent/features/home/data/models/earning_filter_model.dart';
import '../../../../export.dart';
import '../../domain/respository/container_repository.dart';
import '../models/earning_response_model.dart';

class ContainerRepositoryImpl extends ContainerRepository{
  final ContainerDataSource _dataSources;

  ContainerRepositoryImpl(this._dataSources);

  @override
  Future<Either<Failure, List<BoxResponseModel>>> fetchBoxes() async {
    final response = await _dataSources.fetchBoxes();
    return response.fold(
          (failure) => Left(failure),
          (response) async {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failure, AgentEarningResponse>> fetchEarning(EarningFilterModel? filter) async {
    final response = await _dataSources.fetchEarning(filter);
    return response.fold(
          (failure) => Left(failure),
          (response) async {
        return Right(response);
      },
    );
  }
}