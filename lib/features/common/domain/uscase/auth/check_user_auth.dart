import 'package:dartz/dartz.dart';

import '../../../../../export.dart';




class CheckUserToAuthUseCase extends UseCase<bool, NoParams> {
  final IAuthRepository _authRepository;
  CheckUserToAuthUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) =>
      _authRepository.checkUserToAuth();
}
