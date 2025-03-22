import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import '../../../../export.dart';

abstract class ContainerDataSource {
  Future<Either<Failure, List<BoxResponseModel>>> fetchBoxes();
  Future<Either<Failure, AgentEarningResponse>> fetchEarning(EarningFilterModel? filter);

  Future<Either<Failure, BankResponseModel>> fetchMeBank();
  Future<Either<Failure, List<ArchivePaymentResponse>>> fetchArchivePayment();


}

class ContainerDataSourceImpl implements ContainerDataSource {
  final DioClient dioClient;

  ContainerDataSourceImpl(this.dioClient);

  @override
  Future<Either<Failure, List<BoxResponseModel>>> fetchBoxes() async {
    try {
      Response response = await dioClient.get(
        ListAPI.boxes,
          // options: Options(
          //     headers: {
          //       "Authorization":"Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
          //     }
          // )
      );

      if (response.statusCode == 200) {
        List<BoxResponseModel> boxes = [];
        for (var box in response.data) {
          boxes.add(BoxResponseModel.fromJson(box));
        }

        return Right(boxes);
      } else {
        return Left(ServerFailure(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return const Left(ConnectionFailure());
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
  Future<Either<Failure, List<ArchivePaymentResponse>>> fetchArchivePayment() async {
    try {
      Response response = await dioClient.get(
        ListAPI.archivePayment,
          // options: Options(
          //     headers: {
          //       "Authorization":"Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
          //     }
          // )
      );

      if (response.statusCode == 200) {
        List<ArchivePaymentResponse> boxes = [];
        for (var box in response.data['results']) {
          boxes.add(ArchivePaymentResponse.fromJson(box));
        }

        return Right(boxes);
      } else {
        return Left(ServerFailure(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return const Left(ConnectionFailure());
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
  Future<Either<Failure, BankResponseModel>> fetchMeBank() async {
    try {
      Response response = await dioClient.get(
        ListAPI.meBank,
          // options: Options(
          //     headers: {
          //       "Authorization":"Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
          //     }
          // )
      );

      if (response.statusCode == 200) {


        return Right(BankResponseModel.fromJson(response.data));
      } else {
        return Left(ServerFailure(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return const Left(ConnectionFailure());
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
  Future<Either<Failure, AgentEarningResponse>> fetchEarning(EarningFilterModel? filter) async {
    try {
      Response response = await dioClient.get(
        queryParameters: {
          // if(filter != null && filter.box != null) "box": filter.box,
          if(filter != null && filter.pageSize != null) "page_size": filter.pageSize,
          if(filter != null && filter.page != null) "page": filter.page,
          if(filter != null && filter.id != null) "box": filter.id,
          if(filter != null && filter.minAmount != null) "min_amount": filter.minAmount,
          if(filter != null && filter.maxAmount != null) "max_amount": filter.maxAmount ,
          if(filter != null && filter.startDate != null) "start_date": filter.startDate ,
          if(filter != null && filter.endDate != null) "end_date": filter.endDate,
        },
        ListAPI.agentEarnings,
        // options: Options(
        //   headers: {
        //     "Authorization":"Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
        //   }
        // )
      );

      if (response.statusCode == 200) {

        return Right(AgentEarningResponse.fromJson(response.data));
      } else {
        return Left(ServerFailure(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return const Left(ConnectionFailure());
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