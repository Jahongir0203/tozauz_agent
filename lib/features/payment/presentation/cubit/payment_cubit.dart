import 'package:bloc/bloc.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/core/values/app_strings.dart';
import '../../../../export.dart';
import '../../domain/repository/payment_repository.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final ContainerRepository repository;
  final PaymentRepository paymentRepository;

  PaymentCubit(this. repository, this.paymentRepository) : super(PaymentState());

  void resetCreatePaymentSt() {
    emit(state.copyWith(createPaymentSt: Status.UNKNOWN));
  }

  Future<void> getMeBank() async {
    emit(state.copyWith(bankSt: Status.LOADING));
    final response = await repository.fetchMeBank();
    response.fold(
      (failure) => emit(
        state.copyWith(bankSt: Status.ERROR, bankFailure: failure),
      ),
      (boxes) => emit(
        state.copyWith(bankSt: Status.SUCCESS, bankResponseModel: boxes),
      ),
    );
  }

  Future<void> getArchivePayment() async {
    emit(state.copyWith(archivePaymentSt: Status.LOADING));
    final response = await repository.fetchArchivePayment();
    response.fold(
      (failure) => emit(
        state.copyWith(
            archivePaymentSt: Status.ERROR, archivePaymentFailure: failure),
      ),
      (boxes) => emit(
        state.copyWith(
            archivePaymentSt: Status.SUCCESS, archivePaymentList: boxes),
      ),
    );
  }

  Future<void> createPaymentRequest(
      ArchivePaymentResponse archivePayment) async {
    emit(state.copyWith(createPaymentSt: Status.LOADING));

    final response =
        await paymentRepository.createPayment(archivePayment: archivePayment);
    response.fold(
      (failure) {
        emit(
          state.copyWith(
              createPaymentSt: Status.ERROR, createPaymentFailure: failure),
        );
      },
      (response) {
        emit(state.copyWith(createPaymentSt: Status.SUCCESS));
      },
    );
  }
}
