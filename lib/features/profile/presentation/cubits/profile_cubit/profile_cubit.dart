import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/core/values/app_strings.dart';
import 'package:tozauz_agent/features/profile/domain/repository/profile_repository.dart';

import '../../../data/models/update_password_request.dart';

part 'profile_state.dart';

part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(const ProfileState());
  final ProfileRepository _profileRepository;

  Future<void> updatePassword(
      {required UpdatePasswordRequest updatePasswordRequest}) async {
    emit(state.copyWith(status: Status.LOADING));
    final response = await _profileRepository.updatePassword(
        updatePasswordRequest: updatePasswordRequest);
    response.fold(
      (failure) {
        emit(state.copyWith(status: Status.ERROR, failure: failure));
      },
      (response) {
        emit(state.copyWith(status: Status.SUCCESS));
      },
    );
  }
}
