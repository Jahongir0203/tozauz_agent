import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tozauz_agent/core/usecase/usecase.dart' show NoParams;
import 'package:tozauz_agent/features/common/domain/uscase/auth/check_user_auth.dart' show CheckUserToAuthUseCase;
import 'package:tozauz_agent/features/common/domain/uscase/auth/logout.dart' show LogoutUseCase;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._checkUserToAuthUseCase, this._logoutUseCase,)
      : super(InitialState());

  final CheckUserToAuthUseCase _checkUserToAuthUseCase;
  final LogoutUseCase _logoutUseCase;
  // final LoginUseCase loginUseCase;

  Future<void> checkUserToAuth() async {
    var result = await _checkUserToAuthUseCase.call(NoParams());
    result.fold(
      (failure) => emit(UnAuthenticatedState()),
      (response) =>
          emit(response ? AuthenticatedState() : UnAuthenticatedState()),
    );
  }

  // Future<void> login({required String username, required String password}) async {
  //   emit(AuthLoadingState());
  //   var result = await loginUseCase.call(LoginParams(username: username, password: password));
  //   result.fold(
  //     (failure) => emit(UnAuthenticatedState()),
  //     (response) {
  //
  //       emit(response.isNotEmpty ? AuthenticatedState() : UnAuthenticatedState());
  //     }
  //   );
  // }

  Future<void> logout() async {
    await _logoutUseCase.call(NoParams());
  }
}
