import 'package:bloc/bloc.dart';
import 'package:tozauz_agent/core/error/failure.dart';
import 'package:tozauz_agent/core/values/app_strings.dart';
import '../../../../export.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final ContainerRepository repository;
  PaymentCubit(this.repository) : super(PaymentState());



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
        state.copyWith(archivePaymentSt: Status.ERROR, archivePaymentFailure: failure),
      ),
          (boxes) => emit(
        state.copyWith(archivePaymentSt: Status.SUCCESS, archivePaymentList: boxes),
      ),
    );
  }


}
