import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/features/common/data/models/success_model.dart';
import 'package:tozauz_agent/features/profile/data/datasource/profile_datasource.dart';
import 'package:tozauz_agent/features/profile/data/models/update_password_request.dart';
import 'package:tozauz_agent/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl(this._profileDataSource);

  @override
  Future<Either<Failure, SuccessResponse>> updatePassword(
      {required UpdatePasswordRequest updatePasswordRequest}) async {
    final response = await _profileDataSource.updatePassword(
        updatePasswordRequest: updatePasswordRequest);

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
