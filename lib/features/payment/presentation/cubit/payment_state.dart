part of 'payment_cubit.dart';

class PaymentState {
  final BankResponseModel? bankResponseModel;
  final Failure bankFailure, archivePaymentFailure, createPaymentFailure;
  final Status bankSt;
  final Status archivePaymentSt;
  final Status createPaymentSt;
  final List<ArchivePaymentResponse> archivePaymentList;

  PaymentState({
    this.bankResponseModel,
    this.bankFailure = const UnknownFailure(),
    this.archivePaymentFailure = const UnknownFailure(),
    this.createPaymentFailure = const UnknownFailure(),
    this.bankSt = Status.UNKNOWN,
    this.archivePaymentSt = Status.UNKNOWN,
    this.createPaymentSt = Status.UNKNOWN,
    this.archivePaymentList = const [],
  });

  PaymentState copyWith({
    BankResponseModel? bankResponseModel,
    Failure? bankFailure,
    Failure? archivePaymentFailure,
    Failure? createPaymentFailure,
    Status? bankSt,
    Status? archivePaymentSt,
    Status? createPaymentSt,
    List<ArchivePaymentResponse>? archivePaymentList,
  }) {
    return PaymentState(
      bankResponseModel: bankResponseModel ?? this.bankResponseModel,
      bankFailure: bankFailure ?? this.bankFailure,
      archivePaymentFailure:
      archivePaymentFailure ?? this.archivePaymentFailure,
      createPaymentFailure: createPaymentFailure ?? this.createPaymentFailure,
      bankSt: bankSt ?? this.bankSt,
      createPaymentSt: createPaymentSt ?? this.createPaymentSt,
      archivePaymentSt: archivePaymentSt ?? this.archivePaymentSt,
      archivePaymentList: archivePaymentList ?? this.archivePaymentList,
    );
  }
}