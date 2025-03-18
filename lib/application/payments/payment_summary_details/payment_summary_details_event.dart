part of 'payment_summary_details_bloc.dart';

@freezed
class PaymentSummaryDetailsEvent with _$PaymentSummaryDetailsEvent {
  const factory PaymentSummaryDetailsEvent.initialized({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required ShipToInfo shipToInfo,
  }) = _Initialized;
  const factory PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo({
    required PaymentSummaryDetails details,
    required bool isMarketPlace,
  }) = _FetchPaymentSummaryDetailsEvent;

  const factory PaymentSummaryDetailsEvent.fetchPaymentSummaryList({
    required bool isMarketPlace,
  }) = _FetchPaymentSummaryListEvent;

  const factory PaymentSummaryDetailsEvent.fetchBankInstruction() =
      _FetchBankInstruction;

  const factory PaymentSummaryDetailsEvent.fetchAdvice({
    required bool isMarketPlace,
  }) = _FetchAdvice;

  const factory PaymentSummaryDetailsEvent.saveAdvice() = _SaveAdvice;

  const factory PaymentSummaryDetailsEvent.deleteAdvice({
    required bool isMarketPlace,
  }) = _DeleteAdvice;

  const factory PaymentSummaryDetailsEvent.cancelAdvice() = _CancelAdvice;

  const factory PaymentSummaryDetailsEvent.viewSavedAdvice() = _ViewSavedAdvice;
}
