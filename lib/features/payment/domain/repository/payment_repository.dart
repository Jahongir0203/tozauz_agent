import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/archive_payment_response.dart';

abstract class PaymentRepository{
  Future<Either<Failure, ArchivePaymentResponse>> createPayment(
      {required ArchivePaymentResponse archivePayment});
}