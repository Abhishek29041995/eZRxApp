part of 'credit_and_invoice_details_bloc.dart';

@freezed
class CreditAndInvoiceDetailsState with _$CreditAndInvoiceDetailsState {
  const CreditAndInvoiceDetailsState._();
  const factory CreditAndInvoiceDetailsState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<CustomerDocumentDetail> itemsInfo,
    required CreditAndInvoiceItem basicInfo,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _CreditAndInvoiceDetailsState;

  factory CreditAndInvoiceDetailsState.initial() =>
      CreditAndInvoiceDetailsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        itemsInfo: <CustomerDocumentDetail>[],
        basicInfo: CreditAndInvoiceItem.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
      );
}
