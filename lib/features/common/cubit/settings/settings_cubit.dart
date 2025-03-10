//
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tma_mobie/core/error/failure.dart';
// import 'package:tma_mobie/core/usecase/usecase.dart';
// import 'package:tma_mobie/core/values/app_strings.dart';
// import 'package:tma_mobie/features/common/domain/uscase/settings/get_app_lang.dart';
// import 'package:tma_mobie/features/common/domain/uscase/settings/get_app_onboard.dart';
// import 'package:tma_mobie/features/common/domain/uscase/settings/save_app_onboard.dart';
// import 'package:tma_mobie/features/common/domain/uscase/settings/set_app_lang.dart';
//
// part 'settings_state.dart';
//
//
// class SettingsCubit extends Cubit<SettingsState> {
//   SettingsCubit(this._getAppLangUseCase, this._setAppLangUseCase, this._getAppOnboardUseCase, this._setAppOnboardUseCase)
//       : super(const SettingsState());
//
//   final GetAppLangUseCase _getAppLangUseCase;
//   final GetAppOnboardUseCase _getAppOnboardUseCase;
//   final SetAppOnboardUseCase _setAppOnboardUseCase;
//   final SetAppLangUseCase _setAppLangUseCase;
//
//   void loadAppLang() async {
//     emit(state.copyWith(status: Status.LOADING));
//     var result = await _getAppLangUseCase.call(NoParams());
//     result.fold(
//             (failure) =>
//             emit(state.copyWith(failure: failure, status: Status.ERROR)),
//             (lang) => emit(state.copyWith(language: lang, status: Status.UNKNOWN)));
//   }
//
//   void loadAppOnboard() async {
//     emit(state.copyWith(status: Status.LOADING));
//     var result = await _getAppOnboardUseCase.call(NoParams());
//     result.fold(
//             (failure) =>
//             emit(state.copyWith(failure: failure, status: Status.ERROR)),
//             (lang) => emit(state.copyWith(onBoard: lang, status: Status.UNKNOWN)));
//   }
//
//   void saveAppLang(String lang) async {
//     if (isClosed) return; // Exit if the cubit is already closed
//
//     emit(state.copyWith(status: Status.LOADING));
//
//     var result = await _setAppLangUseCase.call(AppLangParam(lang));
//     if (isClosed) return; // Check again if cubit is closed after async operation
//
//     result.fold(
//           (failure) => emit(state.copyWith(failure: failure, status: Status.ERROR)),
//           (lang) => emit(state.copyWith(language: lang, status: Status.UNKNOWN)),
//     );
//   }
//
//
//   void saveAppOnboard(bool onBoard) async {
//     emit(state.copyWith(status: Status.LOADING));
//     var result = await _setAppOnboardUseCase.call(AppOnboardParam(onBoard));
//     result.fold(
//             (failure) =>
//             emit(state.copyWith(failure: failure, status: Status.ERROR)),
//             (lang) => emit(state.copyWith(onBoard: lang, status: Status.UNKNOWN)));
//   }
//
//
// }
