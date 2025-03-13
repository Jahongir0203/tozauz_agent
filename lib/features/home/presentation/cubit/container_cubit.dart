import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/features/home/data/models/earning_response_model.dart';
import 'package:tozauz_agent/features/home/domain/respository/container_repository.dart';

import '../../../../core/values/app_strings.dart';
import '../../data/models/box_response_model.dart';

part 'container_state.dart';

class ContainerCubit extends Cubit<ContainerState> {
  final ContainerRepository repository;

  ContainerCubit(this.repository) : super(ContainerState());

  Future<void> fetchBoxes() async {
    emit(state.copyWith(boxListStatus: Status.LOADING));
    final response = await repository.fetchBoxes();
    response.fold(
          (failure) =>
          emit(state.copyWith(
              boxListStatus: Status.ERROR, boxListFailure: failure),),
          (boxes) =>
          emit(state.copyWith(boxListStatus: Status.SUCCESS, boxList: boxes),
          ),
    );

  }

  Future<void> fetchEarning() async {
    emit(state.copyWith(earningListStatus: Status.LOADING));
    final response = await repository.fetchEarning();
    response.fold(
          (failure) =>
          emit(state.copyWith(
              earningListStatus: Status.ERROR, earningListFailure: failure),),
          (boxes) =>
          emit(state.copyWith(earningListStatus: Status.SUCCESS, earningList: boxes),
          ),
    );
  }
}
