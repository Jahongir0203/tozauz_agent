import 'package:dartz/dartz.dart';

import '../../../../export.dart';
import '../../data/models/update_password_request.dart';

abstract class ProfileRepository{
  Future<Either<Failure, SuccessResponse>> updatePassword(
      {required UpdatePasswordRequest updatePasswordRequest});
}