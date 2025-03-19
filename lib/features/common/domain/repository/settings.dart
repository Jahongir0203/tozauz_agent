import 'package:dartz/dartz.dart';

import '../../../../export.dart';



abstract class ISettingRepository {
  Future<Either<Failure, String>> getAppLang();
  Future<Either<Failure, bool>> setOnBoarding(bool onBoard);
  Future<Either<Failure, bool>> getOnBoarding();
  Future<Either<Failure, String>> setAppLang(String lang);
}
