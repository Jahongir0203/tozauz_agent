import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/features/profile/data/models/update_password_request.dart';

import '../../../../export.dart';

abstract class ProfileDataSource {
  Future<Either<Failure, SuccessResponse>> updatePassword(
      {required UpdatePasswordRequest updatePasswordRequest});
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final DioClient _dioClient;

  ProfileDataSourceImpl(this._dioClient);

  @override
  Future<Either<Failure, SuccessResponse>> updatePassword(
      {required UpdatePasswordRequest updatePasswordRequest}) async {
    try {
      Response response = await _dioClient.post(
        ListAPI.userUpdatePassword,
        data: {
          "old_password": updatePasswordRequest.oldPassword,
          "new_password": updatePasswordRequest.newPassword
        },
        // options: Options(
        //   headers: {
        //     "Authorization": "Token 3ccaf710b1cf1d53c27a0c54f31b67a94350f4f5"
        //   },
        // ),
      );
      if (response.statusCode == 201) {
        return Right(SuccessResponse.fromJson(response.data));
      } else {
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
