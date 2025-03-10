import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';


abstract class IAuthRepository {
  Future<Either<Failure, bool>> checkUserToAuth();
  Future<Either<Failure, bool>> logout();
  // Future<Either<Failure, String>> login({required String username , required String password});

}
