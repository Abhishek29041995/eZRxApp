part of 'credit_and_invoice_details_bloc.dart';

@freezed
class CreditAndInvoiceDetailsEvent with _$CreditAndInvoiceDetailsEvent {
  const factory CreditAndInvoiceDetailsEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Initialized;
  const factory CreditAndInvoiceDetailsEvent.fetch({
    required CreditAndInvoiceItem creditAndInvoiceItem,
    required bool isMarketPlace,
  }) = _Fetch;
  const factory CreditAndInvoiceDetailsEvent.fetchInvoiceById({
    required String invoiceId,
    required bool isMarketPlace,
  }) = _FetchInvoiceById;
}
