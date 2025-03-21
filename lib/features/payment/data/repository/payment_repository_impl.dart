import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/features/payment/data/datasource/payment_datasource.dart';
import 'package:tozauz_agent/features/payment/data/model/archive_payment_response.dart';
import 'package:tozauz_agent/features/payment/domain/repository/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDatSource _paymentDatSource;

  PaymentRepositoryImpl({required PaymentDatSource paymentDatSource})
      : _paymentDatSource = paymentDatSource;

  @override
  Future<Either<Failure, ArchivePaymentResponse>> createPayment(
      {required ArchivePaymentResponse archivePayment}) async {
    final response =
        await _paymentDatSource.createPayment(archivePayment: archivePayment);
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
