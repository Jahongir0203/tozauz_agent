import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/features/common/data/models/user_model.dart';
import '../../../../core/error/failure.dart';


abstract class IAuthRepository {
  Future<Either<Failure, bool>> checkUserToAuth();
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, UserModel>> login({required String username , required String password});

}
