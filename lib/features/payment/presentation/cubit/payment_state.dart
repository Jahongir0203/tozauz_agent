part of 'payment_cubit.dart';


class PaymentState {
  final BankResponseModel? bankResponseModel;
  final Failure bankFailure, archivePaymentFailure;
  final Status bankSt;
  final Status archivePaymentSt;
  final List<ArchivePaymentResponse> archivePaymentList;

  PaymentState({
     this.bankResponseModel,
     this.bankFailure = const UnknownFailure(),
     this.archivePaymentFailure = const UnknownFailure(),
     this.bankSt = Status.UNKNOWN,
     this.archivePaymentSt = Status.UNKNOWN,
     this.archivePaymentList = const [],
  });

  PaymentState copyWith({
    BankResponseModel? bankResponseModel,
    Failure? bankFailure,
    Failure? archivePaymentFailure,
    Status? bankSt,
    Status? archivePaymentSt,
    List<ArchivePaymentResponse>? archivePaymentList,
  }) {
    return PaymentState(
      bankResponseModel: bankResponseModel ?? this.bankResponseModel,
      bankFailure: bankFailure ?? this.bankFailure,
      archivePaymentFailure: archivePaymentFailure ?? this.archivePaymentFailure,
      bankSt: bankSt ?? this.bankSt,
      archivePaymentSt: archivePaymentSt ?? this.archivePaymentSt,
      archivePaymentList: archivePaymentList ?? this.archivePaymentList,
    );
  }
}


