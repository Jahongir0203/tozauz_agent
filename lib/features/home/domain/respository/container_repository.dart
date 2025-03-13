import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/features/home/data/models/box_response_model.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/earning_response_model.dart';

abstract class ContainerRepository{
  Future<Either<Failure, List<BoxResponseModel>>> fetchBoxes();
  Future<Either<Failure, List<EarningResponseModel>>> fetchEarning();
}