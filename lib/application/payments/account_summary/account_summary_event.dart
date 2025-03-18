part of 'account_summary_bloc.dart';

@freezed
class AccountSummaryEvent with _$AccountSummaryEvent {
  const factory AccountSummaryEvent.initialize() = _Initialize;
  const factory AccountSummaryEvent.fetchInvoiceSummary({
    required String custCode,
    required SalesOrg salesOrg,
  }) = _FetchInvoiceSummary;
  const factory AccountSummaryEvent.fetchCreditSummary({
    required String custCode,
    required SalesOrg salesOrg,
  }) = _FetchCreditSummary;
}
