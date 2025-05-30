import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/features/home/data/models/agent_earning_response_model.dart';
import 'package:tozauz_agent/features/home/data/models/box_response_model.dart';
import 'package:tozauz_agent/features/payment/data/model/archive_payment_response.dart';
import 'package:tozauz_agent/features/payment/data/model/bank_response_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/earning_filter_model.dart';

abstract class ContainerRepository{
  Future<Either<Failure, List<BoxResponseModel>>> fetchBoxes();
  Future<Either<Failure, AgentEarningResponse>> fetchEarning(EarningFilterModel? filter);

  Future<Either<Failure, BankResponseModel>> fetchMeBank();
  Future<Either<Failure, List<ArchivePaymentResponse>>> fetchArchivePayment();
}