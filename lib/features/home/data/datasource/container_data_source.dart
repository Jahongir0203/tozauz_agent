import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:tozauz_agent/core/api/api.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/features/home/data/models/box_response_model.dart';
import 'package:tozauz_agent/features/home/data/models/earning_response_model.dart';

import '../../../../export.dart';

abstract class ContainerDataSource {
  Future<Either<Failure, List<BoxResponseModel>>> fetchBoxes();
  Future<Either<Failure, List<EarningResponseModel>>> fetchEarning();
}

class ContainerDataSourceImpl implements ContainerDataSource {
  final DioClient dioClient;

  ContainerDataSourceImpl(this.dioClient);

  @override
  Future<Either<Failure, List<BoxResponseModel>>> fetchBoxes() async {
    try {
      Response response = await dioClient.get(
        ListAPI.boxes,
          options: Options(
              headers: {
                "Authorization":"Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
              }
          )
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
  Future<Either<Failure, List<EarningResponseModel>>> fetchEarning() async {
    try {
      Response response = await dioClient.get(
        ListAPI.boxes,
        options: Options(
          headers: {
            "Authorization":"Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
          }
        )
      );

      if (response.statusCode == 200) {
        List<EarningResponseModel> boxes = [];
        for (var box in response.data) {
          boxes.add(EarningResponseModel.fromJson(box));
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
}