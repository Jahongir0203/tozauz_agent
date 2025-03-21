import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failure.dart';
import 'package:tozauz_agent/export.dart';

abstract class PaymentDatSource {
  Future<Either<Failure, ArchivePaymentResponse>> createPayment(
      {required ArchivePaymentResponse archivePayment});
}

class PaymentDataSourceImpl extends PaymentDatSource {
  final DioClient _dioClient;

  PaymentDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<Either<Failure, ArchivePaymentResponse>> createPayment(
      {required ArchivePaymentResponse archivePayment}) async {
    try {
      Response response = await _dioClient.post(ListAPI.agentPayMeCreate,
          data: {
              "amount": archivePayment.amount,
              "card": archivePayment.card,
              "card_name": archivePayment.cardName

          },
          options: Options(headers: {
            "Authorization": "Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
          }));
      if (response.statusCode == 201) {
        return Right(ArchivePaymentResponse.fromJson(response.data));
      }else{
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
