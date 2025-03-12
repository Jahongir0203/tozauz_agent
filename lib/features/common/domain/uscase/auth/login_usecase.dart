import 'package:dartz/dartz.dart';
import 'package:tozauz_agent/features/common/data/models/user_model.dart';

import '../../../../../export.dart';

class LoginUsecase extends UseCase<UserModel, LoginParams> {
  final IAuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  @override
  Future<Either<Failure, UserModel>> call(LoginParams params) =>
      _authRepository.login(
        username: params.username,
        password: params.password,
      );
}

class LoginParams {
  final String username, password;

  LoginParams(this.username, this.password);
}
