import 'package:dartz/dartz.dart';

import '../../../../../export.dart';



class LogoutUseCase extends UseCase<bool, NoParams> {
  final IAuthRepository _authRepository;
  LogoutUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) =>
      _authRepository.logout();
}
