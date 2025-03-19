// import 'dart:io';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tma_mobie/core/api/api.dart';
// import 'package:tma_mobie/core/error/failure.dart';
// import 'package:tma_mobie/features/common/domain/repository/settings.dart';
//
// class SettingRepository extends ISettingRepository {
//   final SharedPreferences _preferences;
//   SettingRepository(this._preferences);
//
//   @override
//   Future<Either<Failure, String>> getAppLang() async {
//     try {
//       String lang = _preferences.getString(ListAPI.LANG) ?? 'en';
//       return Right(lang);
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         debugPrint("$e");
//       }
//       if (e.error is SocketException) {
//         return const Left(ConnectionFailure());
//       }
//       return Left(
//         (e.response?.statusCode == 401)
//             ? const UnAuthorizationFailure()
//             : ServerFailure(e.response?.statusCode),
//       );
//     } on Object catch (e) {
//       if (kDebugMode) {
//         debugPrint("$e");
//       }
//       rethrow;
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> setAppLang(String lang) async {
//     try {
//       await _preferences.setString(ListAPI.LANG, lang);
//       return Right(lang);
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         debugPrint("$e");
//       }
//       if (e.error is SocketException) {
//         return const Left(ConnectionFailure());
//       }
//       return Left(
//         (e.response?.statusCode == 401)
//             ? const UnAuthorizationFailure()
//             : ServerFailure(e.response?.statusCode),
//       );
//     } on Object catch (e) {
//       if (kDebugMode) {
//         debugPrint("$e");
//       }
//       rethrow;
//     }
//   }
//
//   @override
//   Future<Either<Failure, bool>> getOnBoarding() async {
//     try {
//       bool lang = _preferences.getBool(ListAPI.OnBoard) ?? false;
//       return Right(lang);
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         debugPrint("$e");
//       }
//       if (e.error is SocketException) {
//         return const Left(ConnectionFailure());
//       }
//       return Left(
//         (e.response?.statusCode == 401)
//             ? const UnAuthorizationFailure()
//             : ServerFailure(e.response?.statusCode),
//       );
//     } on Object catch (e) {
//       if (kDebugMode) {
//         debugPrint("$e");
//       }
//       rethrow;
//     }
//   }
//
//   @override
//   Future<Either<Failure, bool>> setOnBoarding(bool onBoard) async {
//     try {
//       await _preferences.setBool(ListAPI.OnBoard, onBoard);
//       return Right(onBoard);
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         debugPrint("$e");
//       }
//       if (e.error is SocketException) {
//         return const Left(ConnectionFailure());
//       }
//       return Left(
//         (e.response?.statusCode == 401)
//             ? const UnAuthorizationFailure()
//             : ServerFailure(e.response?.statusCode),
//       );
//     } on Object catch (e) {
//       if (kDebugMode) {
//         debugPrint("$e");
//       }
//       rethrow;
//     }
//   }
// }
