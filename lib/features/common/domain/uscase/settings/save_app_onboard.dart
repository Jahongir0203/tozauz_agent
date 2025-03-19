// import 'package:dartz/dartz.dart';
// import 'package:tma_mobie/core/error/failure.dart';
// import 'package:tma_mobie/core/usecase/usecase.dart';
// import 'package:tma_mobie/features/common/domain/repository/settings.dart';
//
//
//
// class SetAppOnboardUseCase extends UseCase<bool, AppOnboardParam> {
//   final ISettingRepository _settingRepository;
//
//   SetAppOnboardUseCase(this._settingRepository);
//
//   @override
//   Future<Either<Failure, bool>> call(AppOnboardParam params) =>
//       _settingRepository.setOnBoarding(params.onboard);
// }
//
// class AppOnboardParam {
//   final bool onboard;
//   AppOnboardParam(this.onboard);
// }
