import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tozauz_agent/core/api/api.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/features/common/data/models/user_model.dart';
import 'package:tozauz_agent/features/common/domain/repository/auth.dart' show IAuthRepository;


class AuthRepository implements IAuthRepository {
  final SharedPreferences _preferences;
  final DioClient _client;
  AuthRepository(this._preferences, this._client);


  @override
  Future<Either<Failure, UserModel>> login({required String username, required String password}) async {
      try {
        Response response = await _client.post(
          ListAPI.login,
          data: {
            "phone_number": username,
            "password": password,
          },
        );

        if (response.statusCode == 200) {

          _preferences.setString(ListAPI.ACCESS_TOKEN, response.data['token']);
          _preferences.setInt(ListAPI.userID, response.data['id']);

          UserModel model = UserModel.fromJson(response.data);


          return  Right(model);
        } else {
          return Left(ServerFailure(response.statusCode));
        }
      } on DioException catch (e) {
        if (e.error is SocketException) {
          return const Left(ConnectionFailure());
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

  @override
  Future<Either<Failure, bool>> checkUserToAuth() async {
    try {
      String token = _preferences.getString(ListAPI.ACCESS_TOKEN) ?? '';
      return Right(token.isNotEmpty);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await _preferences.setString(ListAPI.ACCESS_TOKEN, '');
      return const Right(true);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }
}
