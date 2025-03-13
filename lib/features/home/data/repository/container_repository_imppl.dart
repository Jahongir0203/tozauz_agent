import 'package:dartz/dartz.dart';

import '../../../../export.dart';


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

  // Wallet
  @override
  Future<Either<Failure, BankResponseModel>> fetchMeBank() async {
    final response = await _dataSources.fetchMeBank();
    return response.fold(
          (failure) => Left(failure),
          (response) async {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failure, List<ArchivePaymentResponse>>> fetchArchivePayment() async {
    final response = await _dataSources.fetchArchivePayment();
    return response.fold(
          (failure) => Left(failure),
          (response) async {
        return Right(response);
      },
    );
  }
}